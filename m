Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C179812F9D6
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Jan 2020 16:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578065500;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xpkl2ZGSi8nukNOYLuYiqEwmVBufwzpH986sDkTEUWA=;
	b=TxFTLsUgLJ7joGBVRJaan1+kafE9K+VuDhnpkDjzHJfjyi9BbRsSqPWUAJGmoSsePqhfoX
	RxxnxOtVpnftroNjuy3bpJVk80NjV1oBtTDhHFLiCutOxqsYcLUFlPOew5O/48aao9o686
	Xqoi54jBa7yBcGRYiMnldRY/OWXS8q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-TJR9C1GxMVKU0Owme5yQ9Q-1; Fri, 03 Jan 2020 10:31:38 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA768800C7F;
	Fri,  3 Jan 2020 15:31:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BE8860E3E;
	Fri,  3 Jan 2020 15:31:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38C0E820E9;
	Fri,  3 Jan 2020 15:31:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003FVQ99016168 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 10:31:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 78CF17942E; Fri,  3 Jan 2020 15:31:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22C9E63BCA
	for <cluster-devel@redhat.com>; Fri,  3 Jan 2020 15:31:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  3 Jan 2020 09:31:17 -0600
Message-Id: <20200103153123.402971-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/6] gfs2: jdata transactions not
	reserving enough revokes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TJR9C1GxMVKU0Owme5yQ9Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch set, several gfs2 functions failed to reserve enough
revoke entries in the journal. Some examples:

1. gfs2_dinode_dealloc failed to reserve a revoke for the dinode
   being deleted.
2. Any function that allocates dinodes with gfs2_alloc_blocks
   should reserve a revoke because alloc_blocks will premptively
   call trans_remove_revoke to make sure there isn't a pending revoke
   for the new dinode.
3. Any function that potentially will unstuff a stuffed directory
   needs to reserve a revoke because gfs2_unstuff_dinode calls
   gfs2_trans_remove_revoke for the new journaled leaf block.

In addition, function gfs2_trans_remove_revoke unconditionally
decrements tr->tr_num_revoke, and if not enough revokes are reserved, the
value goes from 0 to  4294967295 (-1, but it's an unsigned int). This is la=
ter
re-added to the system-wide revoke numbers, thereby decrementing the value
(sd_log_commited_revoke) "properly," but by accident. This worked properly
most of the time because one transaction would reserve space for revokes,
then it would be merged with the system transaction (sdp->sd_log_tr) and it
usually did not run out, because you can hold a lot of revoke entries
per log descriptor block. Some of the code, such as gfs2_write_revokes, wou=
ld
work around this and somehow got it right most of the time. However, some
jdata tests with xfstests generic/269 encountered problems when it actually
ran out.

This series adds needed revoke entries to the transactions that
need them. So now we try to do proper accounting of revokes.

Bob Peterson (6):
  gfs2: revoke cleanup: leaf_dealloc
  gfs2: revoke cleanup: alloc_dinode and gfs2_create_inode
  gfs2: revoke cleanup: gfs2_dinode_dealloc
  gfs2: revoke cleanup: gfs2_iomap_begin_write
  gfs2: revoke cleanup: truncate functions
  gfs2: revoke cleanup: gfs2_trans_remove_revoke

 fs/gfs2/bmap.c  | 25 +++++++++++++------------
 fs/gfs2/dir.c   |  3 ++-
 fs/gfs2/inode.c |  5 +++--
 fs/gfs2/super.c |  2 +-
 fs/gfs2/trans.c | 16 ++++++++++++++--
 5 files changed, 33 insertions(+), 18 deletions(-)

--=20
2.24.1

