import { Router } from "express";
import { createUser, getUsers } from "../controller/users.controller.js";

const router = Router();

router.post("/", createUser);
router.get("/", getUsers);

export default router;
