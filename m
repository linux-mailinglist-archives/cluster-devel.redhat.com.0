Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A33F86C7073
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Mar 2023 19:45:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679597148;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zkEo5KV5pWtY0chRAyhZO0yxLe6DPrfJex1y5U7s5pA=;
	b=E1TWEqFRNCLp7k7xGEijtaDf+EII5F5HcqNsRrKuN/xO0u+guONgH/Etr9jRMZpEZitI92
	r7+HYlmFxTt6q6+P1JJN+K2jpitero/mKO/zD0VtQro3Ph6cuOmsAteGF2K5HxRoep6sqr
	AXoed8lhNTqfwYXzOxwBZ7g5bAbK5gU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-WZwdODqiM-i7Gq0bZXRtxg-1; Thu, 23 Mar 2023 14:45:45 -0400
X-MC-Unique: WZwdODqiM-i7Gq0bZXRtxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7F7E8028B2;
	Thu, 23 Mar 2023 18:45:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45437140E94F;
	Thu, 23 Mar 2023 18:45:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B08F519465BB;
	Thu, 23 Mar 2023 18:45:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FD081946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Mar 2023 18:45:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4099240CF8F2; Thu, 23 Mar 2023 18:45:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50520400D796;
 Thu, 23 Mar 2023 18:45:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Mar 2023 19:45:37 +0100
Message-Id: <20230323184537.749868-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [GIT PULL] gfs2 fix for v6.3-rc4
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Linus Torvalds <torvalds@linux-foundation.org>

Hi Linus,

please consider pulling the following fix.

Thanks,
Andreas

The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:

  Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git gfs2-v6.3-rc3-fix

for you to fetch changes up to 260595b439776c473cc248f0de63fe78d964d849:

  Reinstate "GFS2: free disk inode which is deleted by remote node -V2" (2023-03-23 19:37:56 +0100)

----------------------------------------------------------------
gfs2 fix

- Reinstate commit 970343cd4904 ("GFS2: free disk inode which is deleted
  by remote node -V2") as reverting that commit could cause
  gfs2_put_super() to hang.

----------------------------------------------------------------
Bob Peterson (1):
      Reinstate "GFS2: free disk inode which is deleted by remote node -V2"

 fs/gfs2/dentry.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

