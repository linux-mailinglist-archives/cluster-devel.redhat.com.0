Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF41B005
	for <lists+cluster-devel@lfdr.de>; Mon, 13 May 2019 07:39:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0B46307CDD5;
	Mon, 13 May 2019 05:39:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 595D110027BF;
	Mon, 13 May 2019 05:39:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1563818089CA;
	Mon, 13 May 2019 05:39:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4D3X6fU031621 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 12 May 2019 23:33:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 266D75D720; Mon, 13 May 2019 03:33:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2AC05D706;
	Mon, 13 May 2019 03:33:03 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2026A3084248;
	Mon, 13 May 2019 03:33:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 487102210C;
	Sun, 12 May 2019 23:33:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute3.internal (MEProxy); Sun, 12 May 2019 23:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KzQDTRHUGlP2t4118
	hjOq4x8DiBylDCwEn5gHvNCjD4=; b=fkWp6iAzsSQSLc1i5Vt20o71uCRAw931S
	1rkWHLSc6OSAfxLci18Ey+KOcDQB6oa+7tEC/0T2eXrQtSfY/buih4LWmGNsSQWm
	ALlraB9fYXjpymF9G1ha/E5L0zstBRH1ZJxHIHkiVhdnF1coESdFHmyF14jeb8lI
	F9hFrqztt6SLL8snC8u7b+/Qf6fu/UyPkz1TgGOsrQhsHTiD55aslyou6Brs9Q0f
	lKKTQYcxv1wDQ8vxap2/O87kOyKaxQ/yyhMxubsTKIGoO6YE1hpMA15X+8ilv3lR
	OzTPOd4KDWK+G9K06g0k07UJxlNeDa0IRPMCkel9EuNfIVMpmrOrw==
X-ME-Sender: <xms:beXYXIJv06QHrKsKULbDulmA5aKXgSoWdhUcbGynL5LwA7ol4S03nA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleefgdejtdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhnucev
	rdcujfgrrhguihhnghdfuceothhosghinheskhgvrhhnvghlrdhorhhgqeenucfkphepud
	dvgedrudeiledrudeirddukeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgsihhn
	sehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:beXYXDSvgPBSeHFltfTu7RA--qVJvRN3dGnNfzi65w2l6xbS6vs6og>
	<xmx:beXYXPH30DI3NeIHfAgDJCpTehoF2TYRvcug5_HbmAay37GFk7Q5Yw>
	<xmx:beXYXAUIezQNS_6vJhp_uVefjTRgeGXHsopl6TW7bL7E4yWgy-JRhQ>
	<xmx:buXYXCrZfw_kxckadxokm1vaDiyapIWTW3pTkQlaP5wf9OaePYJ2KA>
Received: from eros.localdomain (124-169-16-185.dyn.iinet.net.au
	[124.169.16.185])
	by mail.messagingengine.com (Postfix) with ESMTPA id DE4F910378;
	Sun, 12 May 2019 23:32:58 -0400 (EDT)
From: "Tobin C. Harding" <tobin@kernel.org>
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 13 May 2019 13:32:13 +1000
Message-Id: <20190513033213.2468-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Mon, 13 May 2019 03:33:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 13 May 2019 03:33:03 +0000 (UTC) for IP:'66.111.4.29'
	DOMAIN:'out5-smtp.messagingengine.com'
	HELO:'out5-smtp.messagingengine.com' FROM:'tobin@kernel.org'
	RCPT:''
X-RedHat-Spam-Score: 0.271  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,
	SPF_SOFTFAIL) 66.111.4.29 out5-smtp.messagingengine.com 66.111.4.29
	out5-smtp.messagingengine.com <tobin@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 May 2019 01:39:13 -0400
Cc: cluster-devel@redhat.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Tobin C. Harding" <tobin@kernel.org>, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [Cluster-devel] [PATCH] gfs2: Fix error path kobject memory leak
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 13 May 2019 05:39:26 +0000 (UTC)

If a call to kobject_init_and_add() fails we must call kobject_put()
otherwise we leak memory.

Function always calls kobject_init_and_add() which always calls
kobject_init().

It is safe to leave object destruction up to the kobject release
function and never free it manually.

Remove call to kfree() and always call kobject_put() in the error path.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---

Is it ok to send patches during the merge window?

Applies on top of Linus' mainline tag: v5.1

Happy to rebase if there are conflicts.

thanks,
Tobin.

 fs/gfs2/sys.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 1787d295834e..98586b139386 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -661,8 +661,6 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
 	if (error)
 		goto fail_reg;
 
-	sysfs_frees_sdp = 1; /* Freeing sdp is now done by sysfs calling
-				function gfs2_sbd_release. */
 	error = sysfs_create_group(&sdp->sd_kobj, &tune_group);
 	if (error)
 		goto fail_reg;
@@ -687,10 +685,7 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
 fail_reg:
 	free_percpu(sdp->sd_lkstats);
 	fs_err(sdp, "error %d adding sysfs files\n", error);
-	if (sysfs_frees_sdp)
-		kobject_put(&sdp->sd_kobj);
-	else
-		kfree(sdp);
+	kobject_put(&sdp->sd_kobj);
 	sb->s_fs_info = NULL;
 	return error;
 }
-- 
2.21.0

