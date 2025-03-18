-- CreateTable
CREATE TABLE "Players" (
    "identity" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "kicks" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Players_pkey" PRIMARY KEY ("identity")
);

-- CreateTable
CREATE TABLE "PlayerBans" (
    "identity" TEXT NOT NULL,
    "ipPort" TEXT NOT NULL,
    "banTime" TIMESTAMP(3) NOT NULL,
    "banDuration" INTEGER NOT NULL,
    "reason" TEXT NOT NULL,

    CONSTRAINT "PlayerBans_pkey" PRIMARY KEY ("identity")
);

-- CreateTable
CREATE TABLE "PlayerKills" (
    "identity" TEXT NOT NULL,
    "ipPort" TEXT NOT NULL,
    "killedIdentity" TEXT NOT NULL,

    CONSTRAINT "PlayerKills_pkey" PRIMARY KEY ("identity")
);

-- CreateTable
CREATE TABLE "GameServers" (
    "ipPort" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "GameServers_pkey" PRIMARY KEY ("ipPort")
);

-- CreateTable
CREATE TABLE "GameServerConnections" (
    "ipPort" TEXT NOT NULL,
    "PlayerIdentity" TEXT NOT NULL,
    "connectTime" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameServerConnections_pkey" PRIMARY KEY ("ipPort")
);

-- CreateIndex
CREATE UNIQUE INDEX "Players_identity_key" ON "Players"("identity");
