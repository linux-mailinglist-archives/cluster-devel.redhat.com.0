Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09372D15D
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 23:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686603845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=txt62ANlIkQygLpGavEyhBItsoRiI+JGiyGc+VsF2/I=;
	b=jOKWRHGiCv28P0T1qHlma8Hd2+jOqYkJFWKZcYxeloubuLLRub2L3u6ZWkiCPWNsddn+30
	RvGfcf/R51t1S4qWGiXsajCxKmAnxjaY0refYuEzcYkhOd3nQIK+1i+IfL9uOHn/OVPNRm
	iWM9pCiiVQem980FUSoAFD3uRITHBxM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-8jcZzQ6HNri43F_gsaQ-pA-1; Mon, 12 Jun 2023 17:03:45 -0400
X-MC-Unique: 8jcZzQ6HNri43F_gsaQ-pA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8022B85A5BD;
	Mon, 12 Jun 2023 21:02:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 735DBC1604E;
	Mon, 12 Jun 2023 21:02:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C2FF19465BB;
	Mon, 12 Jun 2023 21:02:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CA789194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:02:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9D531C1604E; Mon, 12 Jun 2023 21:02:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95966C1604D
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:02:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DF48801224
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:02:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-H0jJH5aZMPewETGXdgSofw-1; Mon,
 12 Jun 2023 17:02:03 -0400
X-MC-Unique: H0jJH5aZMPewETGXdgSofw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q8ofW-0033wc-R9; Mon, 12 Jun 2023 21:01:42 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jun 2023 22:01:27 +0100
Message-Id: <20230612210141.730128-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v3 00/14] gfs2/buffer folio changes for 6.5
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
Cc: Hannes Reinecke <hare@suse.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This kind of started off as a gfs2 patch series, then became entwined
with buffer heads once I realised that gfs2 was the only remaining
caller of __block_write_full_page().  For those not in the gfs2 world,
the big point of this series is that block_write_full_page() should now
handle large folios correctly.

Andrew, if you want, I'll drop it into the pagecache tree, or you
can just take it.

v3:
 - Fix a patch title
 - Fix some checks against i_size to be >= instead of >
 - Call folio_mark_dirty() instead of folio_set_dirty()

Matthew Wilcox (Oracle) (14):
  gfs2: Use a folio inside gfs2_jdata_writepage()
  gfs2: Pass a folio to __gfs2_jdata_write_folio()
  gfs2: Convert gfs2_write_jdata_page() to gfs2_write_jdata_folio()
  buffer: Convert __block_write_full_page() to
    __block_write_full_folio()
  gfs2: Support ludicrously large folios in gfs2_trans_add_databufs()
  buffer: Make block_write_full_page() handle large folios correctly
  buffer: Convert block_page_mkwrite() to use a folio
  buffer: Convert __block_commit_write() to take a folio
  buffer: Convert page_zero_new_buffers() to folio_zero_new_buffers()
  buffer: Convert grow_dev_page() to use a folio
  buffer: Convert init_page_buffers() to folio_init_buffers()
  buffer: Convert link_dev_buffers to take a folio
  buffer: Use a folio in __find_get_block_slow()
  buffer: Convert block_truncate_page() to use a folio

 fs/buffer.c                 | 257 ++++++++++++++++++------------------
 fs/ext4/inode.c             |   4 +-
 fs/gfs2/aops.c              |  69 +++++-----
 fs/gfs2/aops.h              |   2 +-
 fs/ntfs/aops.c              |   2 +-
 fs/reiserfs/inode.c         |   9 +-
 include/linux/buffer_head.h |   4 +-
 7 files changed, 172 insertions(+), 175 deletions(-)

-- 
2.39.2

