pragma solidity ^0.4.18;

contract Schedule {
    struct Meeting {
        uint date;
    }

    Meeting[] public meetings;

    /**
     * @notice Takes a list of uint timestamps and uses it to populate the meetings array 
     * @param dates An array of uint timestamps representing the meeting time
     */
    function Schedule(uint[] dates) public {
        for (uint i = 0; i < dates.length; i++) {
            meetings.push(Meeting(dates[i]));
        }
    }

    /**
     * @dev TODO: create this function findNextMeetingDate
     * @notice finds the next meeting and returns the unix timestamp
     * @return uint unix timestamp
     */
     function findNextMeetingDate() public returns (uint){
         //get current time
         //compare to meetings[]

         //sanity check, if no meetings return 0
         if(meetings.length == 0){
             return 0;
         }
        uint lowest = 0;
        uint dif = 0;

        
         for(uint i=0; i<meetings.length; i++){
             uint temp = meetings[i].date - block.timestamp;
             
             if(temp > 0){ // the event is in the future
                 if(temp <= dif || dif == 0){
                 //difference between now and this event is lower, so event is sooner.
                 //if dif = 0 this is the first event
                 dif = temp;
                 lowest = meetings[i].date;
                 }
             }
         }
        if(lowest < block.timestamp ){
            //nearest event is in the past
            return 0;
        }

        if(lowest >= block.timestamp){
            return lowest;
        }
     }
}
