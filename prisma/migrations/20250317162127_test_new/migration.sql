/*
  Warnings:

  - The primary key for the `GameServerConnections` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PlayerBans` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PlayerKills` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[identity,ipPort,connectTime]` on the table `GameServerConnections` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[identity,ipPort,banTime]` on the table `PlayerBans` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "GameServerConnections" DROP CONSTRAINT "GameServerConnections_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "GameServerConnections_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "PlayerBans" DROP CONSTRAINT "PlayerBans_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "PlayerBans_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "PlayerKills" DROP CONSTRAINT "PlayerKills_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD CONSTRAINT "PlayerKills_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE INDEX "GameServerConnections_identity_idx" ON "GameServerConnections"("identity");

-- CreateIndex
CREATE INDEX "GameServerConnections_ipPort_idx" ON "GameServerConnections"("ipPort");

-- CreateIndex
CREATE UNIQUE INDEX "GameServerConnections_identity_ipPort_connectTime_key" ON "GameServerConnections"("identity", "ipPort", "connectTime");

-- CreateIndex
CREATE UNIQUE INDEX "PlayerBans_identity_ipPort_banTime_key" ON "PlayerBans"("identity", "ipPort", "banTime");

-- CreateIndex
CREATE INDEX "PlayerKills_identity_idx" ON "PlayerKills"("identity");

-- CreateIndex
CREATE INDEX "PlayerKills_killedIdentity_idx" ON "PlayerKills"("killedIdentity");

-- CreateIndex
CREATE INDEX "PlayerKills_ipPort_idx" ON "PlayerKills"("ipPort");

-- AddForeignKey
ALTER TABLE "PlayerBans" ADD CONSTRAINT "PlayerBans_identity_fkey" FOREIGN KEY ("identity") REFERENCES "Players"("identity") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerBans" ADD CONSTRAINT "PlayerBans_ipPort_fkey" FOREIGN KEY ("ipPort") REFERENCES "GameServers"("ipPort") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerKills" ADD CONSTRAINT "PlayerKills_identity_fkey" FOREIGN KEY ("identity") REFERENCES "Players"("identity") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerKills" ADD CONSTRAINT "PlayerKills_killedIdentity_fkey" FOREIGN KEY ("killedIdentity") REFERENCES "Players"("identity") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerKills" ADD CONSTRAINT "PlayerKills_ipPort_fkey" FOREIGN KEY ("ipPort") REFERENCES "GameServers"("ipPort") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameServerConnections" ADD CONSTRAINT "GameServerConnections_identity_fkey" FOREIGN KEY ("identity") REFERENCES "Players"("identity") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameServerConnections" ADD CONSTRAINT "GameServerConnections_ipPort_fkey" FOREIGN KEY ("ipPort") REFERENCES "GameServers"("ipPort") ON DELETE RESTRICT ON UPDATE CASCADE;
