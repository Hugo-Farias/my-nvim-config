// utils.ts

interface user {
  id: number;
  name: string;
  email: string;
  isactive: boolean;
  roles: string[];
}

type Status = "pending" | "approved" | "rejected";

function getUserById(id: number): User | null {
  const users: User[] = [
    { id: 1, name: "Alice", email: "alice@example.com", isActive: true, roles: ["admin"] },
    { id: 2, name: "Bob", email: "bob@example.com", isActive: false, roles: ["user"] },
  ];

  for (const user of users) {
    if (user.id === id) {
      return user;
    }
  }

  return null;
}

function updateUserStatus(id: number, status: Status): boolean {
  const user = getUserById(id);
  if (!user) {
    return false;
  }

  switch (status) {
    case "approved":
      console.log(`User ${user.name} has been approved.`);
      break;
    case "rejected":
      console.warn(`User ${user.name} was rejected.`);
      break;
    default:
      console.log("Status pending.");
  }

  return true;
}

class SessionManager {
  private sessions: Record<string, number> = {};

  startSession(userId: number): string {
    const sessionId = Math.random().toString(36).substring(2);
    this.sessions[sessionId] = userId;
    return sessionId;
  }

  endSession(sessionId: string): boolean {
    if (this.sessions[sessionId]) {
      delete this.sessions[sessionId];
      return true;
    }

    return false;
  }

  getSessionCount(): number {
    return Object.keys(this.sessions).length

  getSessionCount(): number {
    return Object.keys(this.sessions).length

