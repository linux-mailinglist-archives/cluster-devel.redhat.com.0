Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0B755EFBD
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 22:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656449180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JDvJY4KAHSAg10rH7+lRWHYt9k9YUXyZb7F/uKYKuNk=;
	b=RSOW7e0HtVaee41WDLgkPrZYZL5YMnhSiK9Yi996OQZaRmTPXB4Sri2tzuy24hRJyxRuAk
	XAaHAPJA6ceGG5JopMuVk13UEa7blb5shOLXRhnm+nRhU0kVm8yMG0dpfSzdhftEvS0zxb
	dq88ahOcsv/rutPb3fuG4LB9JJMq7Ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-F-1WBYUVMWeG_KjUBK-SUA-1; Tue, 28 Jun 2022 16:46:17 -0400
X-MC-Unique: F-1WBYUVMWeG_KjUBK-SUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A1BA1019C93;
	Tue, 28 Jun 2022 20:46:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E896040D282F;
	Tue, 28 Jun 2022 20:46:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD5141947058;
	Tue, 28 Jun 2022 20:46:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 75AFF19466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 20:46:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D0A140D2853; Tue, 28 Jun 2022 20:46:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B78840C1289;
 Tue, 28 Jun 2022 20:46:12 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 28 Jun 2022 22:46:06 +0200
Message-Id: <20220628204611.651126-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 0/5] gfs2: debugfs PID reporting improvements
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
Cc: linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently, all glock holders in the "glocks" dump file are reported as
being associated with the process that acquired them, even for holders
that are actually associated with the filesystem itself (like the
journal glock holder) or with cached inodes (like iopen and flock glock
holders).  This is confusing when those holders outlive the processes
that have acquired them, and it trips up utilities that analyze lock
dependencies.  For example, the following two glocks were acquired by
pid 10821 during the initial mount, which has since terminated:

  G:  s:EX n:9/0 f:qb t:EX d:EX/0 a:0 v:0 r:3 m:200 p:0
   H: s:EX f:ecH e:0 p:10821 [(ended)] init_inodes+0x5c2/0xb10 [gfs2]
  G:  s:EX n:2/805f f:qob t:EX d:EX/0 a:0 v:0 r:4 m:200 p:1
   H: s:EX f:H e:0 p:10821 [(ended)] gfs2_fill_super+0x92b/0xcc0 [gfs2]
   I: n:6/32863 t:8 f:0x00 d:0x00000201 s:24 p:0

This patch queue tries to fix this problem in two ways:

 * Glock holders which are not held by the process that acquired them
   are marked as GL_NOPID.  For those holders, the PID is reported as 0,
   and the process name is reported as "(none)".

 * With this change alone, we would have a much harder time detecting
   locking cycles involving iopen or flock glocks: in both cases, a
   process which has a file descriptor open depends on the iopen and
   flock glock of the corresponding inode / file.  To keep track of
   these dependencies, we introduce a new "glockfd" dump file that
   reports which file descriptors of which processes are holding which
   glocks.

A utility that checks for locking problems using this additional
information is forthcoming, but hasn't been completed so far.


NEW EXPORTS

This patch queue requires iterating through all file descriptors of all
processes, which is made easier by exporting find_ge_pid() and
task_lookup_next_fd_rcu(); copying Eric W. Biederman and the
linux-kernel and linux-fsdevel lists to make sure that's okay.


Thanks,
Andreas

Andreas Gruenbacher (5):
  gfs2: Add glockfd debugfs file
  gfs2: Add flocks to glockfd debugfs file
  gfs2: Add GL_NOPID flag for process-independent glock holders
  gfs2: Mark flock glock holders as GL_NOPID
  gfs2: Mark the remaining process-independent glock holders as GL_NOPID

 fs/file.c            |   1 +
 fs/gfs2/file.c       |  29 +++++-
 fs/gfs2/glock.c      | 211 +++++++++++++++++++++++++++++++++++++++++--
 fs/gfs2/glock.h      |   1 +
 fs/gfs2/inode.c      |   6 +-
 fs/gfs2/ops_fstype.c |  14 +--
 fs/gfs2/super.c      |   3 +-
 fs/gfs2/util.c       |   6 +-
 kernel/pid.c         |   1 +
 9 files changed, 247 insertions(+), 25 deletions(-)

-- 
2.35.1

