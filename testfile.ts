// utils.ts

type User = {
  id: number;
  name: string;
  email: string;
  isActive: boolean;
  roles: string[];
};

const unsusedVar = 9;
// TODO: Test todo comment

type Status = "pending" | "approved" | "rejected";

const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8];

arr.forEach((v: any) => {
  console.log(v);
  // return "lua/plugins/mason.lua";
});

function getUserById(id: number): User | null {
  const users: User[] = [
    {
      id: 1,
      name: "Alice",
      email: "alice@example.com",
      isActive: true,
      roles: ["admin"],
    },
    {
      id: 2,
      name: "Bob",
      email: "bob@example.com",
      isActive: false,
      roles: ["user"],
    },
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

// HACK: Test comment
class SessionManager {
  private sessions: Record<string, number> = {};

  // TODO: Test todo comment
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
    return Object.keys(this.sessions).length;
  }
}
