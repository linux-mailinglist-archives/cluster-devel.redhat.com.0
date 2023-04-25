Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7EB6EE378
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Apr 2023 15:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682430651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cuedenV2zpDg+mwEKMh+RMpBblTnjA8zgLowf2hXfJ8=;
	b=gEjF2KsiLXguUOE5weo5s1eMApVgDFYejNejkEepBmwfMLhKOwK0hcw3jLhPmPEIFqhZN8
	eG03qOHc1OFqpLvsu6PmJVDlxyayQWJzSqrdixzipVXhZ62AS0RSMnFu/F25+5i+gAwHpS
	VLYSXa7DeVL8MshAciHizBiWuDli8r0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-gIiL9zP3NniS3aLHFmIPaA-1; Tue, 25 Apr 2023 09:50:49 -0400
X-MC-Unique: gIiL9zP3NniS3aLHFmIPaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D14E1C00AA1;
	Tue, 25 Apr 2023 13:50:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 734A540C2064;
	Tue, 25 Apr 2023 13:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E11F19465A3;
	Tue, 25 Apr 2023 13:50:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 17C861946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Apr 2023 13:50:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C9B2E40C6E68; Tue, 25 Apr 2023 13:50:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.226.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E616140C6E67;
 Tue, 25 Apr 2023 13:50:44 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Apr 2023 15:50:44 +0200
Message-Id: <20230425135044.1100895-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for 6.4
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

please consider pulling the following gfs2 fixes.

Thanks a lot,
Andreas

The following changes since commit 1e760fa3596e8c7f08412712c168288b79670d78:

  Merge tag 'gfs2-v6.3-rc3-fix' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2023-03-23 15:25:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.3-rc3-fixes

for you to fetch changes up to 644f6bf762fa903f64c59c2ec0f4d0d753527053:

  gfs2: gfs2_ail_empty_gl no log flush on error (2023-04-25 11:07:16 +0200)

----------------------------------------------------------------
gfs2 fixes

- Fix revoke processing at unmount and on read-only remount.

- Refuse reading in inodes with an impossible indirect block height.

- Various minor cleanups.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Fix inode height consistency check

Andrew Price (3):
      gfs2: Remove duplicate i_nlink check from gfs2_link()
      gfs2: Remove ghs[] from gfs2_link
      gfs2: Remove ghs[] from gfs2_unlink

Bob Peterson (6):
      gfs2: Eliminate gfs2_trim_blocks
      gfs2: Use gfs2_holder_initialized for jindex
      gfs2: return errors from gfs2_ail_empty_gl
      gfs2: Perform second log flush in gfs2_make_fs_ro
      gfs2: Issue message when revokes cannot be written
      gfs2: gfs2_ail_empty_gl no log flush on error

Markus Elfring (1):
      gfs2: Move variable assignment behind a null pointer check in inode_go_dump

 fs/gfs2/bmap.c       |  8 --------
 fs/gfs2/bmap.h       |  1 -
 fs/gfs2/glops.c      | 23 +++++++++++++++--------
 fs/gfs2/inode.c      | 47 ++++++++++++++++++++++-------------------------
 fs/gfs2/ops_fstype.c |  9 +++------
 fs/gfs2/super.c      |  9 +++++++++
 6 files changed, 49 insertions(+), 48 deletions(-)

