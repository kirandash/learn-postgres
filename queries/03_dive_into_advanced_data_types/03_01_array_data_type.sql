DROP TABLE IF EXISTS arrays_demo;

CREATE TABLE arrays_demo (
	id BIGINT PRIMARY KEY,
	temperatureForDate INTEGER[],
	messagesReceived TEXT[],
	threadList TEXT[][],
	notificationList Text Array
);

INSERT INTO arrays_demo (
    id, 
    temperatureForDate, 
    messagesReceived, 
    threadList, 
    notificationList
) VALUES 
(
    1, 
    ARRAY[30, 32, 31, 29], 
    ARRAY['Hello', 'How are you?', 'Good morning'], 
    ARRAY[
        ARRAY['Thread 1 Message 1', 'Thread 1 Message 2'], 
        ARRAY['Thread 2 Message 1', 'Thread 2 Message 2']
    ], 
    ARRAY['Notification 1', 'Notification 2']
),
(
    2, 
    ARRAY[28, 27, 29, 30], 
    ARRAY['Hey', 'Meeting at 3 PM'], 
    ARRAY[
        ARRAY['Discussion 1', 'Discussion 2'], 
        ARRAY['Follow-up 1', 'Follow-up 2']
    ], 
    ARRAY['Reminder', 'Task Assigned']
);

INSERT INTO arrays_demo (
    id, 
    temperatureForDate, 
    messagesReceived, 
    threadList, 
    notificationList
) VALUES 
(
    3, 
    '{25, 26, 27, 28}', 
    '{"Hi", "What’s up?", "See you later"}', 
    '{{"Thread A - Msg 1", "Thread A - Msg 2"}, {"Thread B - Msg 1", "Thread B - Msg 2"}}', 
    '{"Alert 1", "Alert 2"}'
),
(
    4, 
    '{22, 23, 24, 25}', 
    '{"Hello", "Goodbye"}', 
    '{{"Team Update 1", "Team Update 2"}, {"Project Discussion", "Task Follow-up"}}', 
    '{"System Notification", "Security Alert"}'
);

select * from arrays_demo;

select temperatureForDate, temperatureForDate[0], temperatureForDate[1], temperatureForDate[2:3] , temperatureForDate[2:], temperatureForDate[1:] from arrays_demo;

select temperatureForDate from arrays_demo where temperaturefordate @> ARRAY[25];

select notificationList from arrays_demo where notificationList @> ARRAY['System Notification'];
