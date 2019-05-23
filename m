Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A129E27DA2
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A32D48110B;
	Thu, 23 May 2019 13:05:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BF6A6135E;
	Thu, 23 May 2019 13:05:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 691FF1806B16;
	Thu, 23 May 2019 13:05:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4VcJ009957 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 451D367E64; Thu, 23 May 2019 13:04:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 109226090E
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:04:08 -0500
Message-Id: <20190523130421.21003-14-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 13/26] gfs2: Stop ail1 wait loop
	when withdrawn
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 23 May 2019 13:05:34 +0000 (UTC)

Before this patch, function gfs2_log_flush could get into an infinite
loop trying to clear out its ail1 list. If the file system was
withdrawn (or pending withdraw) due to a problem with writing the ail1
list, it would never clear out the list, and therefore, would loop
infinitely. This patch changes function gfs2_log_flush so that it
does while (!gfs2_withdraw(sdp)) rather than while (;;).

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 9784763fbb4e..2fd43146de00 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -854,7 +854,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 	if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
 		if (!sdp->sd_log_idle) {
-			for (;;) {
+			while (!gfs2_withdrawn(sdp)) {
 				gfs2_ail1_start(sdp);
 				gfs2_ail1_wait(sdp);
 				if (gfs2_ail1_empty(sdp))
-- 
2.21.0

