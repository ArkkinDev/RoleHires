developer = User.find_by(email: "developer@example.com").developer
business = User.find_by(email: "business@example.com").business
conversation = Conversation.find_or_create_by!(developer:, business:)
message = Message.find_or_create_by!(conversation:, sender: business, body: "Your XP looks perfect.")
Message.find_or_create_by!(conversation:, sender: developer, body: "Let's chat over Zoom.")

# MessageMailer#new_message
Notification.find_or_create_by!(type: NewMessageNotification.name, recipient: developer.user, params: {message:, conversation:})

# DeveloperMailer#invisiblize
invisible_developer = User.find_by(email: "invisible@example.com").developer
Notification.find_or_create_by!(type: InvisiblizeDeveloperNotification.name, recipient: invisible_developer.user, params: {developer: invisible_developer})

# AdminMailer#new_business
admin = User.find_by(email: "admin@example.com")
Notification.find_or_create_by!(type: NewBusinessNotification.name, recipient: admin, params: {business:})

# AdminMailer#new_conversation
Notification.find_or_create_by!(type: NewConversationNotification.name, recipient: admin, params: {message:, conversation:})

# AdminMailer#new_developer_profile
Notification.find_or_create_by!(type: NewDeveloperProfileNotification.name, recipient: admin, params: {developer:})

# AdminMailer#potential_hire
developer = User.find_by(email: "hired@example.com").developer
Notification.find_or_create_by!(type: PotentialHireNotification.name, recipient: admin, params: {developer:})
