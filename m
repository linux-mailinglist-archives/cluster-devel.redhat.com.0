Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 411641E22AC
	for <lists+cluster-devel@lfdr.de>; Tue, 26 May 2020 15:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590498434;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VimsCTyDXNagRHYJ/dxpI7LY+3nIkBybWQH+Za47OW8=;
	b=YW3MDWu/70CZ8VwhNspCdvzk/kD26AWJgdo06h/nW0h9aB9QyWyZBmKfz4oJ669zMTTa/P
	Qw57PCdwZ+ZBu6WlpsYERPH1hEUPeMqAoPDVivA8o6yr0pfuz7OdoS6Gw1gaVAzrhPryLr
	GuHbyXS0Jk1tw5WaW+QL95n24hOAYig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-FkLHpFdaOfy-glLMwu-sgQ-1; Tue, 26 May 2020 09:07:12 -0400
X-MC-Unique: FkLHpFdaOfy-glLMwu-sgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC27E100A91D;
	Tue, 26 May 2020 13:07:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BF10703BF;
	Tue, 26 May 2020 13:07:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57A405FBD8;
	Tue, 26 May 2020 13:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04QD5d6k010669 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 09:05:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E918B5D9E7; Tue, 26 May 2020 13:05:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3AF15D9E5
	for <cluster-devel@redhat.com>; Tue, 26 May 2020 13:05:36 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 26 May 2020 08:05:28 -0500
Message-Id: <20200526130536.295081-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/8] Misc Patch Collection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi,

I've been working on a problem whereby glock.c was causing a BUG panic
because gl_revokes was non-zero when the glock is freed. To debug and fix
this, I developed a series of patches, including some new instrumentation
and trace points. Some of these patches are independent, so could be pushed
(or rejected) independently of the others.

So this is my current patch collection. The patch that fixes the problem is
"gfs2: add memory barriers to gfs2_glock_remove_revoke".

Andreas expressed some concerns about some of the others. For example, he
didn't like that the new "status" sysfs file was taking "try" locks, but
if the lock is held, I don't know of a better way to do this. He also expressed
a concern that the new file should be in debugfs rather than sysfs.
I'm open to opinions. Regardless of where it is, the new debug file is a
perfect candidate to include in sos reports.

Bob Peterson

Bob Peterson (8):
  gfs2: Don't ignore inode write errors during inode_go_sync
  gfs2: Allow lock_nolock mount to specify jid=X
  gfs2: add memory barriers to gfs2_glock_remove_revoke
  gfs2: Add new sysfs file for gfs2 status
  gfs2: print mapping->nrpages in glock dump for address space glocks
  gfs2: instrumentation wrt log_flush stuck
  gfs2: Add new trace point for glock ail management
  gfs2: introduce new gfs2_glock_assert_withdraw

 fs/gfs2/glock.c      |  32 +++++++-----
 fs/gfs2/glock.h      |   9 ++++
 fs/gfs2/glops.c      |   8 +--
 fs/gfs2/log.c        |  32 +++++++++---
 fs/gfs2/log.h        |   2 +-
 fs/gfs2/lops.c       |   6 +--
 fs/gfs2/ops_fstype.c |   2 +-
 fs/gfs2/sys.c        | 113 +++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/trace_gfs2.h |  61 +++++++++++++++++++++++
 fs/gfs2/trans.c      |   4 +-
 10 files changed, 241 insertions(+), 28 deletions(-)

-- 
2.26.2

