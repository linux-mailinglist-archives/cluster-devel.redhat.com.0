Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E165A54A
	for <lists+cluster-devel@lfdr.de>; Sat, 31 Dec 2022 16:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672499374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S46GJjFnRtEs4ZF4WLB+hxVTgfYfNE/hUwjLY/tXs74=;
	b=YMEjz4rew2OsRoYR4SL5HZQoyRDZOGuf2oqo0G0eW3gRNWNIgADNoNfGXQ+ve9NxWpWKPB
	d3F3EdsHq+zavdSH6CqEmKK6o0jz1439BG/fe3xhfQ6OufwfnNdjmwnTQurzJLXe79F0cu
	tarnVRocylT0JfJLnP95LkAM0+DZ/q4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-xoGFIro3OM-vpYx-jv6ThQ-1; Sat, 31 Dec 2022 10:09:31 -0500
X-MC-Unique: xoGFIro3OM-vpYx-jv6ThQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C56BB80D182;
	Sat, 31 Dec 2022 15:09:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74F4240C2064;
	Sat, 31 Dec 2022 15:09:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E8B4B194658C;
	Sat, 31 Dec 2022 15:09:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 53EC91946587 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 31 Dec 2022 15:09:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC0A0492B01; Sat, 31 Dec 2022 15:09:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7AE9492B00;
 Sat, 31 Dec 2022 15:09:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sat, 31 Dec 2022 16:09:10 +0100
Message-Id: <20221231150919.659533-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v5 0/9] Turn iomap_page_ops into
 iomap_folio_ops
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
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Here's an updated version of this patch queue.  Changes since v4 [*]:

* I've removed "fs: Add folio_may_straddle_isize helper" as I couldn't
  get any feedback from Al Viro; the patch isn't essential for this
  patch queue.

* The iomap_folio_ops operations have been renamed to ->get_folio() and
  ->put_folio(), and the helpers have been renamed to iomap_get_folio()
  and iomap_put_folio().

* Patch "xfs: Make xfs_iomap_folio_ops static" has been added at the
  end.

The patches are split up into relatively small pieces.  That may seem
unnecessary, but at least it makes reviewing the patches easier.

If there are no more objections, can this go into iomap-for-next?

Thanks,
Andreas

[*] https://lore.kernel.org/linux-xfs/20221218221054.3946886-1-agruenba@redhat.com/

Andreas Gruenbacher (9):
  iomap: Add iomap_put_folio helper
  iomap/gfs2: Unlock and put folio in page_done handler
  iomap: Rename page_done handler to put_folio
  iomap: Add iomap_get_folio helper
  iomap/gfs2: Get page in page_prepare handler
  iomap: Rename page_prepare handler to get_folio
  iomap/xfs: Eliminate the iomap_valid handler
  iomap: Rename page_ops to folio_ops
  xfs: Make xfs_iomap_folio_ops static

 fs/gfs2/bmap.c         | 38 ++++++++++------
 fs/iomap/buffered-io.c | 98 ++++++++++++++++++++++--------------------
 fs/xfs/xfs_iomap.c     | 41 ++++++++++++------
 include/linux/iomap.h  | 51 +++++++++-------------
 4 files changed, 127 insertions(+), 101 deletions(-)

-- 
2.38.1

