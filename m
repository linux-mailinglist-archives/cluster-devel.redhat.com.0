Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4155523DAD0
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JzPrF4E7nG0ZR6KP7YRlLe5bBM6jdP72yeC4kVEz3N0=;
	b=MVxSRCCX8iGR+L4f8zHP7gbXFzrj3oYq1/mf8f2PdLxiBdEDSZXYFslVeK7Zv7wwBMfSpd
	OWZuOzxjid61NuX3hNX0B1BqENdhv/RkFMS31kEd04LZNCA4I04ki8cnVYPAf+3xTBIRJA
	N23pCLsSGPg6YG3aCpPKDX02WROPZec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305--TlFUdw7O66Il51xEzCYIA-1; Thu, 06 Aug 2020 09:38:24 -0400
X-MC-Unique: -TlFUdw7O66Il51xEzCYIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38ED2101C8A0;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2939B712F4;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAE2F1809561;
	Thu,  6 Aug 2020 13:38:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcC8X030611 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D790160BF1; Thu,  6 Aug 2020 13:38:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A7F46FEF4
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:09 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:35 +0100
Message-Id: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 00/32] gfs2-utils: savemeta improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is some groundwork for ongoing performance improvements to gfs2_edit savemeta (and fsck.gfs2 indirectly). These patches are generally beneficial and have survived a bunch of testing so I'm posting them now.

The first handful are scattered cleanups and general removal of gfs2_buffer_heads uses to make things more flexible.

The theme of the savemeta changes is mainly about creating a better split between reading and saving blocks so that we can make better decisions between those paths, e.g. in some cases we want to collect together ranges of blocks for reading when we know that they're consecutive.

Andrew Price (32):
  savemeta: Allow saving to /dev/null
  mkfs.gfs2: Fix strncpy warnings
  libgfs2: Separate out gfs2l's language API
  glocktop: Improve mount info handling
  savemeta: Don't save bad xattr blocks twice
  libgfs2: Remove gfs2_buffer_head from gfs_dinode_in()
  libgfs2: Remove gfs2_buffer_head from lgfs2_gfs_inode_get()
  libgfs2: Remove gfs2_buffer_head from lgfs2_write_journal_data()
  libgfs2: Move get_file_buf() into structures.c
  gfs2l: Remove uses of gfs2_buffer_heads
  libgfs2: No need to use gfs2_buffer_head in metapointer()
  gfs2_edit: Don't use gfs2_buffer_head in do_dinode_extended() args
  libgfs2: Add a display name field to struct lgfs2_metadata
  gfs2_edit: get_block_type() improvements
  gfs2_edit: Don't use gfs2_buffer_head in display_block_type()
  gfs2_edit: Don't use gfs2_buffer_head in display_gfs2()
  gfs2_edit: restore_block() improvements
  savemeta: Simplify di_save_len()
  savemeta: Remove gfs2_buffer_head from get_gfs_struct_info()
  savemeta: Remove gfs2_buffer_head from save_bh() (and rename it)
  savemeta: Don't use gfs2_buffer_head in save_leaf_chain()
  savemeta: Remove gfs2_buffer_head from save_block()
  savemeta: Split block reading from saving
  savemeta: Call get_struct_info() in the read path
  savemeta: Introduce multi-block reads
  savemeta: Process indirect pointers in chunks
  savemeta: Don't trim off trailing zeroes when compressing
  savemeta: Leaf block processing improvements
  savemeta: Remove some unnecessary reads from save_inode_data()
  savemeta: Remove some unnecessary jindex reading code
  savemeta: Move block range queue ops into functions
  restoremeta: Fix up superblock processing

 gfs2/convert/gfs2_convert.c |   2 +-
 gfs2/edit/gfs2hex.c         |  52 ++-
 gfs2/edit/gfs2hex.h         |   5 +-
 gfs2/edit/hexedit.c         | 170 +++------
 gfs2/edit/hexedit.h         |   9 +-
 gfs2/edit/journal.c         |  59 ++--
 gfs2/edit/savemeta.c        | 672 ++++++++++++++++++++++--------------
 gfs2/fsck/metawalk.c        |   2 +-
 gfs2/glocktop/glocktop.c    | 189 +++++-----
 gfs2/libgfs2/Makefile.am    |  14 +-
 gfs2/libgfs2/buf.c          |   4 +-
 gfs2/libgfs2/fs_ops.c       |  33 +-
 gfs2/libgfs2/gfs1.c         |  49 ++-
 gfs2/libgfs2/gfs2l.c        |   1 +
 gfs2/libgfs2/lang.c         | 121 ++++---
 gfs2/libgfs2/lang.h         |  15 +
 gfs2/libgfs2/libgfs2.h      |  32 +-
 gfs2/libgfs2/meta.c         |  30 +-
 gfs2/libgfs2/structures.c   |  52 ++-
 gfs2/mkfs/main_mkfs.c       |   4 +-
 tests/edit.at               |   8 +
 21 files changed, 826 insertions(+), 697 deletions(-)

-- 
2.26.2

