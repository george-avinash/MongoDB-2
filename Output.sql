1. 
==
Zen_Class> db.tasks.find( {submission_date :{$gte:("2020-10-01"),$lt:("2020-11-01"),},});
[
  {
    _id: ObjectId('6575f6144bcb6053ca74dcd2'),
    task_id: '12',
    user_id: 'S004',
    problem_id: '12',
    submission_date: '2020-10-16'
  },
  {
    _id: ObjectId('6575f6144bcb6053ca74dcd3'),
    task_id: '13',
    user_id: 'S005',
    problem_id: '13',
    submission_date: '2020-10-19'
  },
  {
    _id: ObjectId('6575f6144bcb6053ca74dcd4'),
    task_id: '14',
    user_id: 'S005',
    problem_id: '14',
    submission_date: '2020-10-20'
  },
  {
    _id: ObjectId('6575f6144bcb6053ca74dcd5'),
    task_id: '15',
    user_id: 'S005',
    problem_id: '15',
    submission_date: '2020-10-21'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcd6'),
    task_id: '1',
    user_id: 'S001',
    problem_id: '1',
    submission_date: '2020-10-01'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcd7'),
    task_id: '2',
    user_id: 'S001',
    problem_id: '2',
    submission_date: '2020-10-02'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcd8'),
    task_id: '3',
    user_id: 'S001',
    problem_id: '3',
    submission_date: '2020-10-05'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcd9'),
    task_id: '4',
    user_id: 'S002',
    problem_id: '4',
    submission_date: '2020-10-06'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcda'),
    task_id: '5',
    user_id: 'S002',
    problem_id: '5',
    submission_date: '2020-10-07'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcdb'),
    task_id: '6',
    user_id: 'S002',
    problem_id: '6',
    submission_date: '2020-10-08'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcdc'),
    task_id: '7',
    user_id: 'S003',
    problem_id: '7',
    submission_date: '2020-10-09'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcdd'),
    task_id: '8',
    user_id: 'S003',
    problem_id: '8',
    submission_date: '2020-10-12'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcde'),
    task_id: '9',
    user_id: 'S003',
    problem_id: '9',
    submission_date: '2020-10-13'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dcdf'),
    task_id: '10',
    user_id: 'S004',
    problem_id: '10',
    submission_date: '2020-10-14'
  },
  {
    _id: ObjectId('6575f63d4bcb6053ca74dce0'),
    task_id: '11',
    user_id: 'S004',
    problem_id: '11',
    submission_date: '2020-10-15'
  }
]
Zen_Class>


2. Find all the company drives that occurred between 15-Oct-2020 and 31-Oct-2020
===

Zen_Class> db.company_drives.find( { drive_date: {$gte:"2020-10-15", $lte:"2020-10-31"}});
[
  {
    _id: ObjectId('6576ebc93d338a6e858eda83'),
    drive_id: 'D4',
    drive_name: 'Data Science Symposium',
    drive_date: '2020-10-15'
  },
  {
    _id: ObjectId('6576ebc93d338a6e858eda84'),
    drive_id: 'D5',
    drive_name: 'CyberSecurity summit',
    drive_date: '2020-10-22'
  },
  {
    _id: ObjectId('6576ebc93d338a6e858eda85'),
    drive_id: 'D6',
    drive_name: 'Tech innovators Metup',
    drive_date: '2020-10-25'
  },
  {
    _id: ObjectId('6576ebc93d338a6e858eda86'),
    drive_id: 'D7',
    drive_name: 'AI and Machine learning Expo',
    drive_date: '2020-10-28'
  },
  {
    _id: ObjectId('6576ebc93d338a6e858eda87'),
    drive_id: 'D8',
    drive_name: 'Web Development Showcase',
    drive_date: '2020-10-31'
  },
  {
    _id: ObjectId('6576ebc93d338a6e858eda8b'),
    drive_id: 'D12',
    drive_name: 'Robotics and Automation Expo',
    drive_date: '2020-10-18'
  }
]
Zen_Class>

3. Find all the company drives and students who appeared for placement:
===

Zen_Class> db.placement_records.aggregate ( [ {$lookup:{from:"company_drives",localField:"drive_id",foreignField:"drive_id",as:"drive_info" }}, {$lookup:{from:"users",localField:"user_id",foreignField:"user_id",as:"user_info"}},{$project:{"drive_info.drive_name":1,"user_info.user_name":1,result:1 }}]);
[
  {
    _id: ObjectId('6576f0023d338a6e858eda8c'),
    result: 'Selected',
    drive_info: [ { drive_name: 'CyberSecurity summit' } ],
    user_info: [ { user_name: 'Anushka' } ]
  },
  {
    _id: ObjectId('6576f0023d338a6e858eda8d'),
    result: 'Not Selected',
    drive_info: [ { drive_name: 'Tech innovators Metup' } ],
    user_info: [ { user_name: 'Anusha' } ]
  },
  {
    _id: ObjectId('6576f0023d338a6e858eda8e'),
    result: 'Selected',
    drive_info: [ { drive_name: 'Software Expo z' } ],
    user_info: [ { user_name: 'Anushka' } ]
  },
  {
    _id: ObjectId('6576f0023d338a6e858eda8f'),
    result: 'Selected',
    drive_info: [ { drive_name: 'Software Expo z' } ],
    user_info: [ { user_name: 'Aishwarya' } ]
  },
  {
    _id: ObjectId('6576f0023d338a6e858eda90'),
    result: 'Not Selected',
    drive_info: [ { drive_name: 'AI and Machine learning Expo' } ],
    user_info: [ { user_name: 'Anagha' } ]
  },
  {
    _id: ObjectId('6576f0023d338a6e858eda91'),
    result: 'Selected',
    drive_info: [ { drive_name: 'Web Development Showcase' } ],
    user_info: [ { user_name: 'Ambika' } ]
  },
  {
    _id: ObjectId('6576f0023d338a6e858eda92'),
    result: 'Not Selected',
    drive_info: [ { drive_name: 'Cloud Computing Summit' } ],
    user_info: [ { user_name: 'Anushka' } ]
  }
]

4.Find the number of problems solved by a user in codekata:
====

Zen_Class> db.codekata.aggregate ([ { $group: { _id: "$user_id", problem_solved: { $sum : 1},},}, ]);
[
  { _id: 'S004', problem_solved: 3 },
  { _id: 'S001', problem_solved: 3 },
  { _id: 'S002', problem_solved: 3 },
  { _id: 'S005', problem_solved: 3 },
  { _id: 'S003', problem_solved: 3 }
]
Zen_Class>

5.Find all the mentors with more than 15 mentees:
===

Zen_Class> db.mentorship.aggregate ( [ { $group: { _id: "$mentor_id", mentee_count: {$sum: 1} } }, { $match : { mentee_count: {$gt: 15} } } ]);
[ { _id: 1, mentee_count: 16 } ]

6. 

===

Zen_Class> db.users.aggregate ( [ { $lookup:{from:"attendance", localField:"user_id",foreignField:"user_id", as:"attendance_info"} }, {$lookup:{ from:"tasks",localField:"user_id", foreignField:"user_id",as : "tasks_info"}},{$match: {"attendance_info.is_present":false, "tasks_info.submission_date" : { $gte: ("2020-10-15"), $lte:("2020-10-31")}}} ]);
[
  {
    _id: ObjectId('6574650f3b447cb04b45d1a0'),
    email: 'anushka@gmail.com',
    phone: 123456789,
    user_id: 'S001',
    user_name: 'Anushka',
    attendance_info: [
      {
        _id: ObjectId('657736cf705fa090679c93e0'),
        user_id: 'S001',
        date: '2020-10-15',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93e3'),
        user_id: 'S001',
        date: '2020-10-16',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93e6'),
        user_id: 'S001',
        date: '2020-10-19',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93e9'),
        user_id: 'S001',
        date: '2020-10-20',
        is_present: false
      },
      {
        _id: ObjectId('657736cf705fa090679c93ec'),
        user_id: 'S001',
        date: '2020-10-21',
        is_present: false
      },
      {
        _id: ObjectId('657736cf705fa090679c93ef'),
        user_id: 'S001',
        date: '2020-10-26',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f2'),
        user_id: 'S001',
        date: '2020-10-27',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f5'),
        user_id: 'S001',
        date: '2020-10-28',
        is_present: false
      },
      {
        _id: ObjectId('657736cf705fa090679c93f8'),
        user_id: 'S001',
        date: '2020-10-29',
        is_present: true
      }
    ],
    tasks_info: [
      {
        _id: ObjectId('65773c60705fa090679c93fb'),
        user_id: 'S001',
        problem_id: 1,
        submission_date: '2020-10-16'
      },
      {
        _id: ObjectId('65773c60705fa090679c93fc'),
        user_id: 'S001',
        problem_id: 2,
        submission_date: '2020-10-19'
      },
      {
        _id: ObjectId('65773c60705fa090679c93fd'),
        user_id: 'S001',
        problem_id: 3,
        submission_date: '2020-10-26'
      }
    ]
  },
  {
    _id: ObjectId('657466e43b447cb04b45d1a1'),
    email: 'anusha@gmail.com',
    phone: 234567890,
    user_id: 'S002',
    user_name: 'Anusha',
    attendance_info: [
      {
        _id: ObjectId('657736cf705fa090679c93e1'),
        user_id: 'S002',
        date: '2020-10-15',
        is_present: false
      },
      {
        _id: ObjectId('657736cf705fa090679c93e4'),
        user_id: 'S002',
        date: '2020-10-16',
        is_present: false
      },
      {
        _id: ObjectId('657736cf705fa090679c93e7'),
        user_id: 'S002',
        date: '2020-10-19',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93ea'),
        user_id: 'S002',
        date: '2020-10-20',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93ed'),
        user_id: 'S002',
        date: '2020-10-21',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f0'),
        user_id: 'S002',
        date: '2020-10-26',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f3'),
        user_id: 'S002',
        date: '2020-10-27',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f6'),
        user_id: 'S002',
        date: '2020-10-28',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f9'),
        user_id: 'S002',
        date: '2020-10-29',
        is_present: true
      }
    ],
    tasks_info: [
      {
        _id: ObjectId('65773c60705fa090679c93fe'),
        user_id: 'S002',
        problem_id: 1,
        submission_date: '2020-10-19'
      },
      {
        _id: ObjectId('65773c60705fa090679c93ff'),
        user_id: 'S002',
        problem_id: 2,
        submission_date: '2020-10-20'
      },
      {
        _id: ObjectId('65773c60705fa090679c9400'),
        user_id: 'S002',
        problem_id: 3,
        submission_date: '2020-10-26'
      }
    ]
  },
  {
    _id: ObjectId('657466e43b447cb04b45d1a2'),
    email: 'aishwarya@gmail.com',
    phone: 345678910,
    user_id: 'S003',
    user_name: 'Aishwarya',
    attendance_info: [
      {
        _id: ObjectId('657736cf705fa090679c93e2'),
        user_id: 'S003',
        date: '2020-10-15',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93e5'),
        user_id: 'S003',
        date: '2020-10-16',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93e8'),
        user_id: 'S003',
        date: '2020-10-19',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93eb'),
        user_id: 'S003',
        date: '2020-10-20',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93ee'),
        user_id: 'S003',
        date: '2020-10-21',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f1'),
        user_id: 'S003',
        date: '2020-10-26',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f4'),
        user_id: 'S003',
        date: '2020-10-27',
        is_present: true
      },
      {
        _id: ObjectId('657736cf705fa090679c93f7'),
        user_id: 'S003',
        date: '2020-10-28',
        is_present: false
      },
      {
        _id: ObjectId('657736cf705fa090679c93fa'),
        user_id: 'S003',
        date: '2020-10-29',
        is_present: true
      },
      {
        _id: ObjectId('65773fc8705fa090679c9404'),
        user_id: 'S003',
        date: '2020-10-27',
        is_present: true
      },
      {
        _id: ObjectId('65773fe4705fa090679c9405'),
        user_id: 'S003',
        date: '2020-10-27',
        is_present: true
      }
    ],
    tasks_info: [
      {
        _id: ObjectId('65773c60705fa090679c9401'),
        user_id: 'S003',
        problem_id: 1,
        submission_date: '2020-10-16'
      },
      {
        _id: ObjectId('65773c60705fa090679c9402'),
        user_id: 'S003',
        problem_id: 2,
        submission_date: '2020-10-21'
      },
      {
        _id: ObjectId('65773c60705fa090679c9403'),
        user_id: 'S003',
        problem_id: 3,
        submission_date: '2020-10-27'
      }
    ]
  }
]