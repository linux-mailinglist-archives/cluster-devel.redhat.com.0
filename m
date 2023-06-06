Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5EB7242F1
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 14:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686055708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vBuXSuSPdimIWw9Er+nDNajoR4GFZLeXMeLl/oUym/M=;
	b=Ark58RRYNugEymEVAuEhcK8tVpei5bwR/Aghzwp2LSQ7TxYccYyrQ30GaPGqCKgu89NHUR
	ZVd3E1M86OiuFOX8aBoE94RaMbg2T2kQI4LepCdj46oW8/VxRgmXXzwiS098brnWNd1n9F
	T7op7FP+KSc/OgWt9n7FmkX3Oo6Zy2Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-44ukCL2qM2qsQn43X71xBg-1; Tue, 06 Jun 2023 08:48:25 -0400
X-MC-Unique: 44ukCL2qM2qsQn43X71xBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2957E185A7AF;
	Tue,  6 Jun 2023 12:48:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9796140CFD47;
	Tue,  6 Jun 2023 12:48:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2643619465BD;
	Tue,  6 Jun 2023 12:48:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 31E8919465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 12:48:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B69E240218C; Tue,  6 Jun 2023 12:48:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2475492B00;
 Tue,  6 Jun 2023 12:48:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue,  6 Jun 2023 14:48:00 +0200
Message-Id: <20230606124800.1151665-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [GIT PULL] gfs2 fix
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following fix.

Thanks,
Andreas

The following changes since commit 48b1320a674e1ff5de2fad8606bee38f724594dc:

  Merge tag 'for-6.4-rc4-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux (2023-05-30 17:23:50 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.4-rc4-fix

for you to fetch changes up to fa58cc888d67e640e354d8b3ceef877ea167b0cf:

  gfs2: Don't get stuck writing page onto itself under direct I/O (2023-06-01 14:55:43 +0200)

----------------------------------------------------------------
gfs2 fix

- Don't get stuck writing page onto itself under direct I/O.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Don't get stuck writing page onto itself under direct I/O

 fs/gfs2/file.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

