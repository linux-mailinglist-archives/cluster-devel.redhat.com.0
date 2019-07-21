Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B7F6F2AA
	for <lists+cluster-devel@lfdr.de>; Sun, 21 Jul 2019 12:44:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3FAA30821A3;
	Sun, 21 Jul 2019 10:43:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE2EB60A9D;
	Sun, 21 Jul 2019 10:43:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 541B04E58E;
	Sun, 21 Jul 2019 10:43:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6LAhl2A028835 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 21 Jul 2019 06:43:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6013261F21; Sun, 21 Jul 2019 10:43:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A0375D739
	for <cluster-devel@redhat.com>; Sun, 21 Jul 2019 10:43:45 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
	[80.12.242.132])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E22859455
	for <cluster-devel@redhat.com>; Sun, 21 Jul 2019 10:43:43 +0000 (UTC)
Received: from localhost.localdomain ([92.140.204.221]) by mwinf5d33 with ME
	id fNjg2000X4n7eLC03Njht7; Sun, 21 Jul 2019 12:43:41 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Jul 2019 12:43:41 +0200
X-ME-IP: 92.140.204.221
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: ccaulfie@redhat.com, teigland@redhat.com
Date: Sun, 21 Jul 2019 12:43:22 +0200
Message-Id: <20190721104322.30019-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Sun, 21 Jul 2019 10:43:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Sun, 21 Jul 2019 10:43:44 +0000 (UTC) for IP:'80.12.242.132'
	DOMAIN:'smtp10.smtpout.orange.fr' HELO:'smtp.smtpout.orange.fr'
	FROM:'christophe.jaillet@wanadoo.fr' RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 80.12.242.132 smtp10.smtpout.orange.fr
	80.12.242.132 smtp10.smtpout.orange.fr
	<christophe.jaillet@wanadoo.fr>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] dlm: fix a typo
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Sun, 21 Jul 2019 10:43:58 +0000 (UTC)

s/locksapce/lockspace

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/dlm/lockspace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 00fa700f4e83..9c95df8a36e9 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -870,7 +870,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
  * until this returns.
  *
  * Force has 4 possible values:
- * 0 - don't destroy locksapce if it has any LKBs
+ * 0 - don't destroy lockspace if it has any LKBs
  * 1 - destroy lockspace if it has remote LKBs but not if it has local LKBs
  * 2 - destroy lockspace regardless of LKBs
  * 3 - destroy lockspace as part of a forced shutdown
-- 
2.20.1

