# Functional Requirements

## User Management

Requirements

- E-mail verification
- A user must have: e-mail, password, first_name, last_name, username, role (optional), avatar (optional)

Use

- Ability to sign up
- Ability to delete account
- Ability to log in
- Ability to log out
- Ability to edit own profile information
- Ability to add own avatar
- Ability to remove own avatar

<br />

## Project Management

Requirements

- New projects are created with new section named "general"
- New projects are created with an empty description
- Project creator is admin and member as default
- A project must have: title, description (optional), user_id, start_date (optional), end_date(optional), admins, members

Use

- Ability to create a new project
- Ability to delete a project (as admin)
- Ability to edit project title (as admin)
- Ability to edit project description (as admin)
- Ability to edit project start date (as admin)
- Ability to edit project end date (as admin)
- Ability to invite users to collaborate (as admin)
- Ability to assign roles to project members (as admin)
- Ability to unassign roles to project members (as admin)
- Ability to remove self from a project (also removes privileges)
- Ability to remove a member from a project (as admin)
- Ability to move a card between sections (as admin)

<br />

## Project Section Management

Requirements

- New sections are created with a card example
- New sections are created with an empty description
- A section must have: title, description (optional), tags (optional), color (optional), project_id, user_id, leader_id (optional), start_date (optional), end_date(optional), team

Use

- Ability to create a new section (as admin)
- Ability to delete a section (as admin/section leader)
- Ability to assign section leaders (as admin)
- Ability to unassign section leaders (as admin)
- Ability to assign members to section teams (as admin)
- Ability to unassign members to section teams (as admin)
- Ability to unassign self as section leader (as section leader)
- Ability to unassign self as section team member (as section leader)
- Ability to edit section title (as admin/section leader)
- Ability to edit section description (as admin/section leader)
- Ability to edit section tags (as admin/section leader)
- Ability to edit section color (as admin/section leader)
- Ability to edit section start date (as admin/section leader)
- Ability to edit section end date (as admin/section leader)

<br />

## Card Management

Requirements

- A card must have: title, description (optional), tags (optional), color (optional), section_id, user_id, leader_id (optional), team (optional), start_date (optional), end_date(optional), priority, status, category, attachments
- Feature category
  - statuses: new/in progress/paused/done
- Issue category
  - statuses: new/confirmed/in progress/paused/done
  - Ability to resolve

Use

- Ability to create a new card
- Ability to delete a card (as admin/section leader/card leader/creator)
- Ability to edit card title (as admin/section leader/card leader/creator)
- Ability to edit card description (as admin/section leader/card leader/creator)
- Ability to edit card tags (as admin/section leader/card leader/card team member)
- Ability to edit card color (as admin/section leader/card leader/card team member)
- Ability to edit card start date (as admin/section leader/card leader/card team member)
- Ability to edit card end date (as admin/section leader/card leader/card team member)
- Ability to edit card priority (as admin/section leader/card leader/creator)
- Ability to edit card status (as admin/section leader/card leader/card team member)
- Ability to edit card category (as admin/section leader/card leader)
- Ability to attach images to a card (as admin/section leader/card leader/creator)
- Ability to remove images from a card (as admin/section leader/card leader/creator)
- Ability to assign a member as card leader (as admin/section leader)
- Ability to unassign a member as card leader (as admin/section leader)
- Ability to assign members to card teams (as admin/section leader)
- Ability to unassign members to card teams (as admin/section leader)
- Ability to assign self to card teams (as admin/section leader/section team member)
- Ability to unassign self from card teams (as admin/section leader/section team member/card team member)

<br />

## Comments

Requirements

- A comment must have: content, tags (optional), card_id, user_id, attachments (optional)

Use

- Ability to create a new comment on a card
- Ability to delete a comment (as admin/section leader/creator)
- Ability to edit a comment (as creator)
- Ability to attach images to a comment (as creator)
- Ability to tag another project member

<br />

## Responses

Requirements

- A response must have: content, comment_id, user_id

Use

- Ability to create a new response on a comment
- Ability to delete a response (as admin/section leader/card leader/creator)
- Ability to edit a response (as admin/section leader/card leader/as creator)
- Ability to tag another project member in the response (as creator)

<br />


## Notifications

Requirements

- A notification must have: user_id (responsible for the action), trigger(action to be notified), object(what suffered the action), time (when the action happened)
- Should have an icon for each action

Events

- When a member joins a the project (to admins)
- When a new section s created (to admins)
- When a section is deleted (to admins)
- When a member is assigned as section leader (to admins/section team/member)
- When a member is assigned as card leader (to admins/section team(leader)/card team/member)
- When member is assigned to card (to card team(lead)/member)
- When a new card is created (to section leader)
- When a new comment is created (to card team(lead))
- When card status is changed (to section leader/card team)
- When card priority is changed (to section leader/card team)
- When card start date is changed (to section leader/card team)
- When card end date is changed (to section leader/card team)

<br />

## Dashboard

Requirements

- All items should be shown with numbers and collapsible lists

Should display:

- Project title
- Number of members
- List of members
- Number of sections
- List of sections
- Number of cards
- Graphic with general project progress (card status vs card number)

<br />

## Navbar

Should display:

- Project list
- Login options
- Home
- Notifications

<br />

## Displays

### General

- Have a search bar

### Planning Phase (or SRS Mode)

- All project items listed in form of an SRS
- Ability to export content as Markdown

### Maintenance Phase (or Continuous Delivery Mode)

- Queue section
  - Displays an issue queue
- Table display
  - Divided by sections
  - Each sections has cards as rows
  - Dates displayed at timeline column
  - A bar above status/priority/category showing percentages
- Kanban display
  - Divided by status
  - Cards are draggable
- Filter display
  - My deck (cards) displayed on a table with all card columns
  - A table with totals
- Card display
  - Card title
  - Card description
  - Card section
  - Card project
  - Card lead
  - Card team
  - Card priority
  - Card status
  - Card start date
  - Card end date
  - Card updates
  - Card history

<br />

## Text editor

Requirements

- Displayed at card and comment create/edit

Formats

- bold
- italic
- underline
- strikethrough
- bullets
- code
