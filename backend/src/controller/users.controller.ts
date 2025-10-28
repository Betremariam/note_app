import type { Request, Response } from "express";
import { createUserService, getUsersService } from "../services/users.service.js";

export const createUser = async (req: Request, res: Response) => {
  try {
    const user = await createUserService(req.body);
    res.json(user);
  } catch (error) {
    res.status(400).json({ message: "Error creating user", error });
  }
};

export const getUsers = async (_req: Request, res: Response) => {
  try {
    const users = await getUsersService();
    res.json(users);
  } catch (error) {
    res.status(400).json({ message: "Error fetching users", error });
  }
};
