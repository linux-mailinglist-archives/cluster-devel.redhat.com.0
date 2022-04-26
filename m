Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37026510108
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Apr 2022 16:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650984896;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m1+l/UGo7OHrjM3HAPBBJI03KFTiilbKvsV44XOQqzw=;
	b=WTp6RNnX/6Pi1InmLSfa5NpRxaQTkZTqgnn5LaUHH2YTRbxlaGuG5SVb/w4j01a7VBlRbq
	eG6PC+WCN3vxaskSBNA9ESNrOWThm15cCBWFKEbSKCpepUaMHL45TrCfVtdHYIGR9xubWG
	Go79WWom+Hg/FnN6TLC/3pn5nR+ep64=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-SKEiKyiSOgSZZ0qpD_QPiQ-1; Tue, 26 Apr 2022 10:54:53 -0400
X-MC-Unique: SKEiKyiSOgSZZ0qpD_QPiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC8DE3C172D3;
	Tue, 26 Apr 2022 14:54:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B0857C52;
	Tue, 26 Apr 2022 14:54:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3F0C11947BBF;
	Tue, 26 Apr 2022 14:54:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 765C919451EC for <cluster-devel@listman.corp.redhat.com>;
 Tue, 26 Apr 2022 14:54:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 060A314682C2; Tue, 26 Apr 2022 14:54:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2126E14682C8;
 Tue, 26 Apr 2022 14:54:45 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Apr 2022 16:54:45 +0200
Message-Id: <20220426145445.2282274-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fix for 5.18-rc5.

Also, note that we're fighting with a rare case of data corruption that
seems to have been introduced by commit 00bfe02f4796 ("gfs2: Fix mmap +
page fault deadlocks for buffered I/O"; merged in v5.16).  The
corruption seems to occur in gfs2_file_buffered_write() when
fault_in_iov_iter_readable() is involved.  We do end up with data that's
written at an offset, as if after a fault-in, the position in the iocb
got out of sync with the position in the iov_iter.  The user buffer the
iov_iter points at isn't page aligned, so the corruption also isn't page
aligned.  The code all seems correct and we couldn't figure out what's
going on so far.

Thanks,
Andreas

The following changes since commit af2d861d4cd2a4da5137f795ee3509e6f944a25b:

  Linux 5.18-rc4 (2022-04-24 14:51:22 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.18-rc4-fix

for you to fetch changes up to e57f9af73d6b0ffb5f1aeaf6cec9a751dd8535c9:

  gfs2: Don't re-check for write past EOF unnecessarily (2022-04-26 15:38:00 +0200)

----------------------------------------------------------------
gfs2 fix

- Only re-check for direct I/O writes past the end of the file after
  re-acquiring the inode glock.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Don't re-check for write past EOF unnecessarily

 fs/gfs2/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

