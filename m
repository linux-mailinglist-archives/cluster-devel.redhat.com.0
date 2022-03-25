Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC084E7528
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Mar 2022 15:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648219056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=APpOKgLW/XVuuqFg3wnuG5e3Lqz2v9rBU7f5RVBpsJ8=;
	b=c++PWdMjeMjXrlpkQzqT0psDmbyyvNNTpaGGXDKwvhXlj2+mlYpHrW71tO5v+Bt76gE91M
	ZhDQn0pX50hgRdyyITAENI+Er68YqVHCRTUi7k33/I2+o17rEd9YBn0nMxOdXFozS7nXet
	L6OGbBW1+u3nDkkJKO4m5fLPPXoi0+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-Es5DufFSMnK7jxlPwlVklw-1; Fri, 25 Mar 2022 10:37:32 -0400
X-MC-Unique: Es5DufFSMnK7jxlPwlVklw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5D6A1066688;
	Fri, 25 Mar 2022 14:37:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3D141457F19;
	Fri, 25 Mar 2022 14:37:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1FA541940352;
	Fri, 25 Mar 2022 14:37:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C20371940341 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 14:37:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A30522024CB8; Fri, 25 Mar 2022 14:37:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35ABC200B66E;
 Fri, 25 Mar 2022 14:37:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Mar 2022 15:37:01 +0100
Message-Id: <20220325143701.144731-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [GIT PULL] fs/iomap: Fix buffered write page
 prefaulting
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hello Linus,=0D
=0D
please consider pulling the following fix, which I've forgotten to send=0D
in the previous merge window.  I've only improved the patch description=0D
since.=0D
=0D
Thank you very much,=0D
Andreas=0D
=0D
The following changes since commit 42eb8fdac2fc5d62392dcfcf0253753e821a97b0=
:=0D
=0D
  Merge tag 'gfs2-v5.16-rc2-fixes' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/gfs2/linux-gfs2 (2021-11-17 15:55:07 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/=
write-page-prefaulting=0D
=0D
for you to fetch changes up to 631f871f071746789e9242e514ab0f49067fa97a:=0D
=0D
  fs/iomap: Fix buffered write page prefaulting (2022-03-25 15:14:03 +0100)=
=0D
=0D
----------------------------------------------------------------=0D
Fix buffered write page prefaulting=0D
=0D
----------------------------------------------------------------=0D
Andreas Gruenbacher (1):=0D
      fs/iomap: Fix buffered write page prefaulting=0D
=0D
 fs/iomap/buffered-io.c | 2 +-=0D
 mm/filemap.c           | 2 +-=0D
 2 files changed, 2 insertions(+), 2 deletions(-)=0D

