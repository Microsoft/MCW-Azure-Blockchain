pragma solidity ^0.4.20;

contract WorkbenchBase {
    event WorkbenchContractCreated(string applicationName, string workflowName, address originatingAddress);
    event WorkbenchContractUpdated(string applicationName, string workflowName, string action, address originatingAddress);

    string internal ApplicationName;
    string internal WorkflowName;

    function WorkbenchBase(string applicationName, string workflowName) internal {
        ApplicationName = applicationName;
        WorkflowName = workflowName;
    }

    function ContractCreated() internal {
        WorkbenchContractCreated(ApplicationName, WorkflowName, msg.sender);
    }

    function ContractUpdated(string action) internal {
        WorkbenchContractUpdated(ApplicationName, WorkflowName, action, msg.sender);
    }
}


contract TelemetryCompliance is WorkbenchBase('TelemetryCompliance', 'TelemetryCompliance')
{
    enum StateType {
        Creating,
        Created,
        TransitionRequestPending,
        InTransit,
        FinalDelivery,
        Completed,
        OutOfCompliance
    }

    StateType public State;

    address public InitiatingCounterparty;
    address public Counterparty;
    address public PreviousCounterparty;
    address public RequestedCounterparty;
    address public Device;
    address public SupplyChainOwner;
    address public SupplyChainObserver;

    int public MinHumidity;
int public MaxHumidity;
int public MinTemperature;
int public MaxTemperature;
int public LastHumidity;
int public LastTemperature;
uint public LastSensorUpdateTimestamp;


enum SensorType { None, Humidity, Temperature }
bool public ComplianceStatus;
string public ComplianceDetail;
SensorType public ComplianceSensorType;
int public ComplianceSensorReading;

function TelemetryCompliance(address device, address supplyChainOwner, address supplyChainObserver, int minHumidity, int maxHumidity, int minTemperature, int maxTemperature) public
{
    ComplianceStatus = true;
    ComplianceSensorReading = -1;
    InitiatingCounterparty = msg.sender;
    Counterparty = InitiatingCounterparty;
    Device = device;
    SupplyChainOwner = supplyChainOwner;
    SupplyChainObserver = supplyChainObserver;
    MinHumidity = minHumidity;
    MaxHumidity = maxHumidity;
    MinTemperature = minTemperature;
    MaxTemperature = maxTemperature;
    State = StateType.Created;
    ContractCreated();
}

function IngestTelemetry(int humidity, int temperature, uint timestamp) public
{
    if (Device != msg.sender || State == StateType.OutOfCompliance || State == StateType.Completed)
    {
        revert();
    }
    
    LastHumidity = humidity;
    LastTemperature = temperature;
    LastSensorUpdateTimestamp = timestamp;
    
    if (humidity > MaxHumidity || humidity < MinHumidity)
    {
        ComplianceSensorType = SensorType.Humidity;
        ComplianceSensorReading = humidity;
        ComplianceDetail = 'Humidity value out of range.';
        ComplianceStatus = false;
    }
    else if (temperature > MaxTemperature || temperature < MinTemperature)
    {
        ComplianceSensorType = SensorType.Temperature;
        ComplianceSensorReading = temperature;
        ComplianceDetail = 'Temperature value out of range.';
        ComplianceStatus = false;
    }

    if (ComplianceStatus == false)
    {
        State = StateType.OutOfCompliance;
        /*When updating state */
        ContractUpdated("IngestTelemetry");
    }
}

function RequestTransferResponsibility( address newCounterparty ) public
{
    if (Counterparty != msg.sender || (State != StateType.Created && State != StateType.InTransit) || newCounterparty == Device || newCounterparty == SupplyChainObserver)
    {
        revert();
    }
    RequestedCounterparty = newCounterparty;
    State = StateType.TransitionRequestPending;
    /*When updating state */
    ContractUpdated("RequestTransferResponsibility");
}

function AcceptTransferResponsibility() public
{
    if (RequestedCounterparty != msg.sender || State != StateType.TransitionRequestPending)
    {
        revert();
    }

    PreviousCounterparty = Counterparty;
    Counterparty = RequestedCounterparty;
    RequestedCounterparty = 0x0;
    State = StateType.InTransit;
    /*When updating state */
    ContractUpdated("AcceptTransferResponsibility");
}

function TakeFinalDelivery() public
{
    if (Counterparty != msg.sender || State != StateType.InTransit)
    {
        revert();
    }

    State = StateType.FinalDelivery;
    /*When updating state */
    ContractUpdated("TakeFinalDelivery");
}

function Complete() public
{
    if (SupplyChainOwner != msg.sender || State != StateType.FinalDelivery)
    {
        revert();
    }

    PreviousCounterparty = Counterparty;
    Counterparty = 0x0;
    State = StateType.Completed;
    /*When updating state */
    ContractUpdated("Complete");
}

}
