Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 33A1B2594E1
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Sep 2020 17:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598975052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vq2S5aDhir33w6kaSB87G+QHZqTnj7afTYkSD/rEpiI=;
	b=DL3msXC7sh2p+EJ3h+Q0HKt8p0zqwlU/jsAfOdO6Gu7/GISa/W5Fzu5B6GlCzJpj6wdjVL
	1loTnmvEwkmUxiuXqeyJ1gC6ik8G7o6lHnF1BfGFZwwJZkwa9s/JVBnxTh42wCreifXDy1
	jER6vb9/T1A2yY6Srk646WHI4SxNK6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-TnNPCGl8Mx-XReYhGJRICg-1; Tue, 01 Sep 2020 11:44:10 -0400
X-MC-Unique: TnNPCGl8Mx-XReYhGJRICg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 768E110ABDAB;
	Tue,  1 Sep 2020 15:44:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 426235E1DD;
	Tue,  1 Sep 2020 15:44:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5533779A35;
	Tue,  1 Sep 2020 15:44:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 081FfnHX023696 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 11:41:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C11F31002D50; Tue,  1 Sep 2020 15:41:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.213] (unknown [10.33.36.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B398810027A6;
	Tue,  1 Sep 2020 15:41:45 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com, users@clusterlabs.org
Message-ID: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
Date: Tue, 1 Sep 2020 16:41:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] gfs2-utils 3.3.0 released
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi all,

I am pleased to announce the 3.3.0 release of gfs2-utils.

This release brings further tooling support for the new log header and 
resource group fields, bug fixes across the board, testing improvements, 
and various other fixes, cleanups and code re-structuring.

Some user-visible changes:

  * mkfs.gfs2 now defaults to a 4K block size even when the device 
reports a smaller optimal i/o size (as reported for shared NVMe devices 
in cloud environments)
  * Extensive man page improvements
  * gfs2_edit restoremeta can now restore bzip2-compressed files
    + New build-dependency: bzip2
  * Improved gfs2_jadd error handling, particularly on a full filesystem
  * The gfs2_withdraw_helper script is now installed to $libexecdir

See below for a complete list of changes.

The source tarball is available from:

   https://releases.pagure.org/gfs2-utils/gfs2-utils-3.3.0.tar.gz

Please test, and report bugs against the gfs2-utils component of Fedora 
rawhide: 
https://bugzilla.redhat.com/enter_bug.cgi?product=Fedora&component=gfs2-utils&version=rawhide

Thanks,
Andy


Changes since version 3.2.0:

Abhi Das (2):
       gfs2_jadd: Handle out-of-space issues
       gfs2_jadd: error handling overhaul

Andreas Gruenbacher (6):
       libgfs2: Update metadata definition of gfs2_log_header.lh_flags
       libgfs2: Allow to suppress symbol prefixes
       libgfs2: lgfs2_field_str: Separate field extraction from printing
       libgfs2: lgfs2_field_str: Allow to decode bitmasks
       libgfs2: Fix gfs[2]_log_header metadata description
       gfs2edit: journal dump: decode lh_flags

Andrew Price (86):
       scripts: Install gfs2_withdraw_helper into $libexecdir
       configure: Show $libexecdir in configure summary
       Add 82-gfs2-withdraw.rules to .gitignore
       libgfs2: Make the resource group plan system more flexible
       fsck.gfs2: Don't check fs formats we don't recognise
       libgfs2: Fix pointer cast byte order issue
       gfs2-utils: String handling fix-ups for gcc9
       Fix libuuid linking
       Fix more linking errors
       gfs2.5: General updates and layout improvements
       gfs2_grow.8: Add a reference to the lvm docs
       testsuite: Skip tests if unshipped helpers are not found
       mkfs.gfs2: Improve alignment of first resource group
       fsck.gfs2: Remove some unnecessary and slow gettext calls
       fsck.gfs2: Disambiguate 'check_data'
       libgfs2: Speed up bread()
       gfs2-utils: Accept a char* instead of a buffer head in 
gfs2_check_meta
       fsck.gfs2: Disambiguate check_metalist
       mkfs.gfs2: Use strncpy to copy lockproto/table into sb
       gfs2_edit: Don't move cursor when displaying indirect blocks
       fsck.gfs2(8): Manpage updates
       fsck.gfs2: Fix segfault in build_and_check_metalist
       fsck.gfs2: Retain context for indirect pointers in ->check_metalist
       fsck.gfs2: Clear bad indirect block pointers when bitmap meets 
expectations
       restoremeta: Use zlib by file descriptor
       restoremeta: Abstract out metadata file opening
       restoremeta: Use metafd instead of gzFile for parameters
       restoremeta: Abstract out decompression operations
       restoremeta: Combine restore_init() and open_metadata()
       restoremeta: Don't seek in restore_header()
       savemeta: Remove anthropomorphize()
       restoremeta: Remove find_highest_block()
       restoremeta: Metadata file reading overhaul
       restoremeta: Convert iseof function to a flag
       restoremeta: Combine parse_header() and check_header()
       restoremeta: Add bzip2 support
       restoremeta: Skip the right number of bytes for the superblock
       tests: Add fsck.gfs2 test script
       gfs2.5: Update some mentions of gfs2_tool
       libgfs2: Don't use bh's in gfs_rgrp_in/out
       libgfs2: Remove bi_bh from struct gfs2_bitmap
       savemeta: Save rgrps without using gfs2_buffer_heads
       savemeta: Check file format version properly
       savemeta: Use larger buffers for gzip compression
       mkfs.gfs2: Don't use i/o limits hints <4K for block size
       gfs2_jadd: Fix static analysis warnings
       mkf.gfs2: Clarify when extended options are invalid
       tests: Don't use fail_unless in unit tests
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
       mkfs.gfs2: Don't exceed IOV_MAX when zeroing first alignment gap
       mkfs.gfs2: Tighten minimum journal size checks
       Update copyright notices
       Convert README to markdown
       Update translation template
       Use the current version in AC_INIT()

Bob Peterson (1):
       gfs2-utils: Wrong hash value used to clean journals

Valentin Vidic (1):
       gfs2-utils: Fix bashism in test script

