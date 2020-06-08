Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id ACFA51F1CB7
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632170;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U+u1R+iET8IuSnZfw1oUk9gvNw2lpXBlXqu3YkNXDYA=;
	b=Vng1BYLYsb3bLohoVi9c1NnaJl8SrttRq+DZutACrVAoTyNke4rD40d3zsulQhMe5lgEDL
	OIC/sTsWS6JFUZ22ZLnZSsjeUJde70rcRN8OJCPdeC8hSzh4+ga4NJvpXEx/imSyLxAq7X
	kuncvk7xecjflbKe2Qvpe/0HWFqYpxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-KhgCp0YpPdSBCZRZdV64zw-1; Mon, 08 Jun 2020 12:02:48 -0400
X-MC-Unique: KhgCp0YpPdSBCZRZdV64zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B6D2107ACF2;
	Mon,  8 Jun 2020 16:02:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A8802B4D3;
	Mon,  8 Jun 2020 16:02:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 658DB180954D;
	Mon,  8 Jun 2020 16:02:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0ilO011588 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9349E648DB; Mon,  8 Jun 2020 16:00:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4F6B60C1D;
	Mon,  8 Jun 2020 16:00:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:19 +0200
Message-Id: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 00/20] GFS2: Pre-pull patch posting (merge
	window)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi,

for this merge window, we have the iopen glock locking scheme rework
patches which noticably speed up deletes when inodes are used from
multiple nodes [*], various bug fixes and debugging improvements, and a
documentation ReST conversion patch.

[*] https://www.redhat.com/archives/cluster-devel/2020-January/msg00064.html

Thanks,
Andreas

Andreas Gruenbacher (9):
  gfs2: Keep track of deleted inode generations in LVBs
  gfs2: Turn gl_delete into a delayed work
  gfs2: Give up the iopen glock on contention
  gfs2: Try harder to delete inodes locally
  gfs2: Minor gfs2_lookup_by_inum cleanup
  gfs2: Move inode generation number check into gfs2_inode_lookup
  gfs2: Check inode generation number in delete_work_func
  gfs2: Wake up when setting GLF_DEMOTE
  gfs2: Smarter iopen glock waiting

Bob Peterson (10):
  gfs2: Don't ignore inode write errors during inode_go_sync
  gfs2: Allow lock_nolock mount to specify jid=X
  gfs2: Only do glock put in gfs2_create_inode for free inodes
  gfs2: print mapping->nrpages in glock dump for address space glocks
  gfs2: introduce new gfs2_glock_assert_withdraw
  gfs2: instrumentation wrt log_flush stuck
  gfs2: Allow ASPACE glocks to also have an lvb
  gfs2: initialize transaction tr_ailX_lists earlier
  gfs2: new slab for transactions
  gfs2: fix use-after-free on transaction ail lists

Mauro Carvalho Chehab (1):
  docs: filesystems: convert gfs2-glocks.txt to ReST

-- 
2.26.2

