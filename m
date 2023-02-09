Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBFF690996
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Feb 2023 14:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675948424;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SakXhgzxqqtztrXxSOgUPFSp5hjG4LjvzPEn+0IMlAs=;
	b=QZY6FMDwoTK+RitCJiG9ulTTHg9LvHBioSCMft2sEi2oBnI9f6dCkZRg6cfGC6QdIKRygf
	hj07zGFloD0nzIZ6mr7MvYOrbE7R7JZOK8QxRNwWFGggVgyS0mWP5Zb0qLFD+5t+8muQc7
	gvVcrVym9FikAk1Hrqq5YCSDtRsp9jY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-8JNF4URDPmqXNm6bGebufQ-1; Thu, 09 Feb 2023 08:13:41 -0500
X-MC-Unique: 8JNF4URDPmqXNm6bGebufQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9376A100F82E;
	Thu,  9 Feb 2023 13:13:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9292492B00;
	Thu,  9 Feb 2023 13:13:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B2961946594;
	Thu,  9 Feb 2023 13:13:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 49E8F1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 13:13:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 589C940C83B6; Thu,  9 Feb 2023 13:13:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 512A340B42D4
 for <cluster-devel@redhat.com>; Thu,  9 Feb 2023 13:13:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 318A9280558B
 for <cluster-devel@redhat.com>; Thu,  9 Feb 2023 13:13:05 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-t_P2SI4POVaX3cA1XBuNeg-1; Thu, 09 Feb 2023 08:13:03 -0500
X-MC-Unique: t_P2SI4POVaX3cA1XBuNeg-1
Received: by mail-qv1-f71.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso1196850qvu.12
 for <cluster-devel@redhat.com>; Thu, 09 Feb 2023 05:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SakXhgzxqqtztrXxSOgUPFSp5hjG4LjvzPEn+0IMlAs=;
 b=sALpMYxNmQIVsTRtizpqTMkywzjayQ41CRbwypAiYEZvy0ovr1Iywhys832mNvEAO/
 O8e0gz/viKNbOpVcEpEF1ysc+GtHw44vTZDSiJq8zld9OKOv6DFrI+33PgrWSC4j6bsN
 UneHA6EOkulqlEObAIZy3psaKdBr+ggPrL/Jr1h9YJg3LHCY7U0XtqnfRdfkg3b9YtJ1
 oYcvX9L6rJOLJKCusbPetpVCQfP8+0S0OShTGs09ao/q6mF/ag8Q7UAL/XaSyqfZq78Y
 W5h1G8EWGln+Bk78MT82H6/mTkS0CWwr9BDhMgluU90lH4Q44fXEPKjWVy2TAXr9nidq
 lnrQ==
X-Gm-Message-State: AO0yUKVhAs/XEikkhux011Fg4WXKFqnKm74fs0siHlDJFop4ocZ+r15N
 ER7qS4cORyyzvh8dv0JsVpVQjOFRBz8ijBeP/NPP05XXr+9szxQBsCMrKQwxbCA9pTEeO76aFc7
 1TEA9QKjrPDxEwnCmsouv3VJ1gqHCjkCM1RzaDTxS5ctv8RD1DmfPJGcc9NwUYJgMt2i5bTuSix
 rh+A==
X-Received: by 2002:a05:6214:230f:b0:56c:60c:2b07 with SMTP id
 gc15-20020a056214230f00b0056c060c2b07mr20740639qvb.44.1675948383171; 
 Thu, 09 Feb 2023 05:13:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+i70rVpxkEyRh2kVgyriZuOGuqZpBabtDO1J6XA4D5rAMI1QsGUrvW/zMvTkib1YN0IJ3FfQ==
X-Received: by 2002:a05:6214:230f:b0:56c:60c:2b07 with SMTP id
 gc15-20020a056214230f00b0056c060c2b07mr20740579qvb.44.1675948382654; 
 Thu, 09 Feb 2023 05:13:02 -0800 (PST)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a05620a014500b006fcb77f3bd6sm1278381qkn.98.2023.02.09.05.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 05:13:01 -0800 (PST)
Message-ID: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
Date: Thu, 9 Feb 2023 13:12:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: cluster-devel <cluster-devel@redhat.com>,
 Cluster Labs - All topics related to open-source clustering welcomed
 <users@clusterlabs.org>, developers@clusterlabs.org
From: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] gfs2-utils 3.5.0 released
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

gfs2-utils contains the tools needed to create, check, modify and 
inspect gfs2 filesystems along with support scripts needed on every gfs2 
cluster node.

The main themes in this release are improved testability and test 
coverage, with a number of bug fixes and a couple of new features thrown 
in too.

Some highlights visible to users and packagers:

- mkfs.gfs2 now has a -U option to provide your own UUID (added to 
support idempotent Ansible playbooks)
- gfs2_jadd now creates journals much faster
- The bzip2 configure check has been fixed to work on distros other than 
the Fedora family (which ship their own pkg-config file)
- Man pages have been improved

We now have CI testing enabled for gfs2-utils (thanks, Fabio!) which 
means that pull requests will be automatically tested across multiple 
distros and architectures. Static analysis will also now be more useful 
as the results are much less cluttered with false-positives. This all 
helps to ramp up the quality of the utils over time as we continue to 
add support for new gfs2 features.

There are also portability improvements included in this release which 
mean that building gfs2-utils against a non-glibc libc should not 
require much patching (probably just an rpmatch() replacement).

The full git shortlog is below.

The release tarballs and signed checksums can be found here:

https://releases.pagure.org/gfs2-utils/

Direct link for convenience:

https://releases.pagure.org/gfs2-utils/gfs2-utils-3.5.0.tar.gz

Please report bugs to the cluster-devel@redhat.com mailing list or at:

https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=gfs2

Patches or pull requests can be sent to the same list or submitted on 
Pagure:

https://pagure.io/gfs2-utils

Thanks,
Andy

gfs2-utils changes since 3.4.1:

Andreas Gruenbacher (7):
       fsck.gfs2: Clean up metawalk_check_data and undo_check_data 
argument passing
       fsck.gfs2: Minor data type cleanups
       fsck.gfs2: More flexible metalist handling in check_metatree
       fsck.gfs2: Move struct error_block into metawalk.c
       fsck.gfs2: Fix some endianness annotations
       fsck.gfs2: Factor out error handling in metawalk_check_data
       fsck.gfs2: Convert enum values to upper-case

Andrew Price (255):
       Update version string for dev
       gfs2_jadd: Use fallocate to preallocate journals
       gfs2_jadd: Don't fsync after each block written
       libgfs2: Move gfs1_ri_update() into gfs2_convert
       gfs2_convert: Remove fd parameter from gfs1_ri_update
       libgfs2: Fold __ri_update into ri_update
       libgfs2: Move ri_update() into fsck.gfs2
       libgfs2: Clean up rindex_read()
       Update some variable names for consistency
       libgfs2: Implement meta.c checks as unit tests
       libgfs2: Move build_rgrps into fsck.gfs2
       libgfs2: Remove fs_geometry.c
       libgfs2: Replace lgfs2_rgrps_root() with lgfs2_attach_rgrps()
       fsck.gfs2: Update an inaccessible web address
       libgfs2: Move block_list.c into fsck.gfs2
       fsck.gfs2: Refactor fetch_rgrps()
       fsck.gfs2: Call rindex_read() outside of ri_update()
       fsck.gfs2: Rename ri_update to read_rgrps
       fsck.gfs2: Fix bounds check in find_next_rgrp_dist()
       fsck.gfs2: Improve rindex consistency check
       configure: Don't define _FORTIFY_SOURCE for gcov builds
       Import linux/gfs2_ondisk.h
       Remove HAS_UUID conditionals
       Remove GFS2_HAS_LEAF_HINTS conditionals
       Remove GFS2_HAS_DE_RAHEAD/COOKIE conditionals
       Remove GFS2_HAS_RG_SKIP conditionals
       Remove GFS2_HAS_RG_RI_FIELDS conditionals
       Remove GFS2_HAS_LH_V2 conditionals
       Use PRI* when printing gfs2 structures
       Remove gfs2/include/linux_endian.h
       libgfs2: Add __force tags to endianness conversion macros
       fsck.gfs2: Fix declaration mismatch for invalidate_*
       Include asm/types.h in our linux/types.h
       libgfs2: Provide macros for printing on-disk fields
       libgfs2: Add a function for printing on-disk meta headers
       libgfs2: Expect big-endian data when printing log descriptors
       libgfs2: Remove gfs2_log_descriptor_{in,out}
       libgfs2: Remove gfs2_quota_change_{in,out}
       libgfs2: Remove gfs2_statfs_change_{in,out}
       libgfs2: Remove gfs2_ea_header_in
       libgfs2: Convert gfs2_leaf_print to accept big-endian data
       libgfs2: Remove gfs2_quota_{in,out}
       Convert rgrp printing functions to expect big-endian data
       libgfs2: Convert gfs2_sb_print to expect big-endian data
       gfs2_edit: Convert superblock printing to expect big-endian
       gfs2_edit: Store big-endian data in the global dinode
       libgfs2: Don't use on-disk structs with cpu-endian data in 
__init_dinode
       libgfs2: Fix endianness mismatches for struct gfs2_log_header
       gfs2_edit: Clean up display_gfs2()
       libgfs2: Add a cpu-endian log header struct
       libgfs2: Remove gfs2_dinode_print()
       libgfs2: Remove i_di from struct gfs2_inode
       libgfs2: Remove big-endian structs from struct rgrp_tree
       libgfs2: Remove sd_sb from struct gfs2_sbd
       libgfs2: Remove some now-unused functions
       gfs2_edit: Use native-endian types for dirent processing
       libgfs2: Endianness improvements for gfs2_inum and gfs2_dirent
       Remove some users of gfs2_leaf_in()
       libgfs2: Endianness improvements for gfs2_leaf
       libgfs2: Remove gfs2_meta_header_{in,out}
       libgfs2: Fix endianness conversions for superblock padding fields
       libgfs2: Don't parse/write de_cookie
       libgfs2: Broaden use of struct lgfs2_inum
       gfs2l: Sparse fixes
       libgfs2: Fix endianness tagging for gfs2_bit_search
       libgfs2: Remove gfs_jindex_in
       Fix sparse warnings about linkage
       fsck.gfs2: Remove unused invalidate_fxns
       libgfs2: Fix the remaining sparse warnings
       gfs2_convert: Fix the remaining sparse warnings
       gfs2_edit: Fix remaining endianness sparse warnings
       fsck.gfs2: Fix remaining endianness sparse warnings
       libgfs2: Add NULL-checking for ip->i_bh in inode_put()
       gfs2_edit: Fix segfault in hexdump()
       libgfs2: Avoid potential gfs/gfs2 superblock update clash
       Make sure i_bh is set after lgfs2_gfs_inode_get()
       tunegfs2: Use O_EXCL when opening the device rw
       tests: Increase the size of the sparse file used by tests
       libgfs2: Remove new_rgrps from struct gfs2_sbd
       libgfs2: Remove start and length from struct rgrp_tree
       fsck.gfs2: Simplify compute_rgrp_layout()
       fsck.gfs2: Simplify how_many_rgrps()
       libgfs2: Remove rgcalc from struct gfs2_sbd
       fsck.gfs2: Rename rg_repair() to rindex_repair()
       gfs2_edit: Fix NULL check in print_block_type()
       libgfs2: Fix leak of bh in read_sb()
       libgfs2: Remove unnecessary cast from gfs2_lookupi()
       gfs2_edit: Don't free buf in save_leaf_chain()
       libgfs2: Remove sd_max_dirres from struct gfs2_sbd
       libgfs2: Remove unused fields from struct gfs2_sbd
       libgfs2: Rename sdp->time to sdp->sd_time
       gfs2_grow.8: Man page improvements
       docs: Update branch name in README.contributing
       tunegfs2: Use PRIu64 instead of casting uint64_t to unsigned long 
long
       gfs2_convert: Use PRIu64 instead of casting uint64_t to unsigned 
long long
       mkfs.gfs2: Use PRIu64 instead of casting uint64_t to unsigned 
long long
       gfs2_grow: Use PRIu64 instead of casting uint64_t to unsigned 
long long
       gfs2_edit: Use PRIu64 instead of casting uint64_t to unsigned 
long long
       libgfs2: Use PRIu64 instead of casting uint64_t to unsigned long long
       glocktop: Use PRIu64 instead of casting uint64_t to unsigned long 
long
       fsck.gfs2: Use PRIu64 instead of casting uint64_t to unsigned 
long long
       fsck.gfs2: Rename warm_fuzzy_stuff()
       Update copyright notices
       Update translation template
       configure: Fix check for bzip2
       fsck.gfs2: Clean up set_block_ranges()
       gfs2_jadd: Clean up definitions from linux/fs.h
       libgfs2: Move debugging printf out of build_master()
       libgfs2: Rework lgfs2_build_jindex()
       libgfs2: Move build_jindex() into fsck.gfs2
       libgfs2: Push down build_per_node() into the utils
       libgfs2: Return the inode from build_inum_range()
       libgfs2: Return the inode from build_statfs_change()
       libgfs2: Return the inode from build_quota_change()
       libgfs2: Return the inode from build_inum()
       libgfs2: Return the inode from build_statfs()
       libgfs2: Return the inode from build_rindex()
       libgfs2: Return the inode from build_quota()
       libgfs2: Move debugging printf out of build_root()
       libgfs2: Remove debugging printf from do_init_statfs()
       libgfs2: Move debugging output out of do_init_inum()
       libgfs2: Remove debugging printfs from fix_device_geometry()
       libgfs2: Remove config.[ch]
       libgfs2: Move struct printing functions out of libgfs2
       libgfs2: Remove print_it extern requirement
       gfs2_edit: Clean up some unused macros
       gfs2_edit: Remove the remaining die() calls
       gfs2_edit: Fix usage of getch()
       libgfs2: Namespace improvements - structures.c
       libgfs2: Namespace improvements - buf.c
       libgfs2: Namespace improvements - fs_ops.c
       libgfs2: Namespace improvements - fs_bits.c
       libgfs2: Namespace improvements - gfs1.c
       libgfs2: Namespace improvements - misc.c
       libgfs2: Namespace improvements - rgrp.c
       libgfs2: Namespace improvements - super.c
       libgfs2: Namespace improvements - gfs2_disk_hash.c
       libgfs2: Remove revoke function declarations from libgfs2.h
       libgfs2: Namespace improvements - recovery.c
       libgfs2: Namespace improvements - device_geometry.c
       libgfs2: Namespace improvements - struct gfs2_inode
       libgfs2: Namespace improvements - struct gfs2_buffer_head
       libgfs2: Namespace improvements - struct gfs2_sbd
       libgfs2: Namespace improvements - struct metapath
       libgfs2: Namespace improvements - struct master_dir
       libgfs2: Namespace improvements - struct device
       libgfs2: Namespace improvements - struct gfs2_bitmap
       libgfs2: Namespace improvements - constants
       libgfs2: Namespace improvements - struct rgrp_tree
       fsck.gfs2: Reorganize pass1_fxns
       tests: Regenerate testvol where needed
       tests: Add an option to clean up the testvol file unconditionally
       Excplicitly ignore posix_fadvise() return value
       Add basic unit tests for lgfs2_lookupi()
       Use calloc in test_rgrps_write_final()
       gfs2_jadd.8: Man page improvements
       gfs2l: Remove redundant #include <sys/queue.h>
       Don't use glibc internal symbols
       Add LTLIBINTL to LDADD where needed
       fsck.gfs2: Use atexit() where on_exit() is not available
       mkfs.gfs2: Use realpath() instead of canonicalize_file_name()
       Configure script updates
       mkfs.gfs2: Add -U UUID option
       gfs2_convert: Fix uninitialized usage warning
       fsck.gfs2: Introduce struct fsck_cx
       fsck.gfs2: Pass the fsck_cx into the metawalk_fxns
       fsck.gfs2: Don't define names in the gfs2_ namespace
       fsck.gfs2: Move the global dup_blocks into fsck_cx
       fsck.gfs2: Move the global dirtree into fsck_cx
       fsck.gfs2: Move the global inodetree into fsck_cx
       fsck.gfs2: Move the global preen into fsck_options
       fsck.gfs2: Move the global force_check into fsck_options
       fsck.gfs2: Pass fsck_options into initialize()
       fsck.gfs2: Pass fsck_options into replay_journals()
       fsck.gfs2: Pass fsck_options into recover_journal()
       fsck.gfs2: Pass fsck_options into preen_is_safe()
       fsck.gfs2: Pass fsck_options into destroy()
       fsck.gfs2: Remove unused query field from fsck_options
       fsck.gfs2: Add an options pointer to fsck_cx
       fsck.gfs2: Pass fsck_cx into check_rgrp(s)_integrity()
       fsck.gfs2: Pass fsck_cx into rebuild_master()
       fsck.gfs2: Pass fsck_cx into lookup_per_node()
       fsck.gfs2: Pass fsck_cx into fill_super_block()
       fsck.gfs2: Pass fsck_cx into sb_repair()
       fsck.gfs2: Pass fsck_cx into peruse_metadata()
       fsck.gfs2: Pass fsck_cx into peruse_{system,user}_dinode()
       fsck.gfs2: Pass fsck_cx into reconstruct_journals()
       fsck.gfs2: Pass fsck_cx into correct_journal_seg_size()
       fsck.gfs2: Pass fsck_cx into reset_journal_seg_size()
       fsck.gfs2: Pass fsck_cx into init_rindex()
       fsck.gfs2: Pass fsck_cx into ask_remove_eattr_entry()
       fsck.gfs2: Pass fsck_cx into check_i_goal()
       fsck.gfs2: Pass fsck_cx into handle_inconsist()
       fsck.gfs2: Pass fsck_cx into update_rgrp()
       fsck.gfs2: Pass fsck_cx into check_block_status()
       fsck.gfs2: Pass fsck_cx into rewrite_rg_block()
       fsck.gfs2: Pass fsck_cx into fsck_query()
       fsck.gfs2: Remove the global opts variable
       Remove sd_bsize assignments which have no effect
       mkfs.gfs2: Improve journal write error reporting
       Remove dependency on linux/fs.h
       Remove dependency on linux/limits.h
       README: Remove kernel headers requirement
       configure: Only use AC_PROG_CC_C99 for autoconf < 2.70
       Add configure~ to .gitignore
       Add error checking to lgfs2_build_height()
       Add error checking to lgfs2_block_map()
       Add error checking to lgfs2_gfs1_block_map()
       Don't call exit() in lgfs2_write_journal
       Don't call exit() in lgfs2_build_quota_change
       Remove lgfs2_breadm()
       Add error checking to lgfs2_unstuff_dinode()
       Remove some exit() calls
       Add error checking to lgfs2_dir_split_leaf()
       Add error checking to dir_make_exhash()
       Add error checking to dir_double_exhash()
       libgfs2: Remove the remaining exit() calls
       libgfs2: Add member name prefixes to struct _lgfs2_rgrps
       libgfs2: Make sure block_alloc() fails when out of space
       libgfs2: Add unit tests for lgfs2_dinode_alloc()
       Add "tags" to .gitignore
       Update year in copyright notices
       libgfs2: Add unit test for lgfs2_meta_alloc()
       libgfs2: Remove rgrps count from struct lgfs2_sbd
       libgfs2: Consistently use rt_ prefix in struct lgfs2_rgrp_tree
       mkfs.gfs2: Add a root_inherit_jdata extended option
       libgfs2: Return the inode from lgfs2_lookupi()
       libgfs2: Remove lgfs2_gfs_createi()
       libgfs2: Reorganise lgfs2_createi()
       fsck.gfs2: Remove de variable from dirref_find()
       fsck.gfs2: Fix wrong entry used in dentry comparison
       fsck.gfs2: fix_hashtable: Decrement i_blocks when freeing leaf blocks
       Free per_node in build_per_node error paths
       Silence some coverity false-positives
       libgfs2: Add lgfs2_inode_free()
       libgfs2: Add lgfs2_bfree()
       Fix potential resource leaks spotted by coverity
       mkfs.gfs2: Fix bounds checking in parse_ulong()
       Suppress some copy-and-paste coverity warnings
       Fix up some unused value warnings
       Fix use-after-free warnings from coverity
       mkfs.gfs2: Annotate a TOCTOU false-positive
       Silence some false "weak crypto" warnings
       savemeta: Silence an infinite loop false-positive
       libgfs2: Fix potential NULL deref in lgfs2_lookupi()
       Suppress coverity warning in osi_erase()
       fsck.gfs2: Double check that the sysinode pointer has been set
       gfs2_grow: Don't free rgs when it's NULL
       Annotate coverity false-positive in find_next_rgrp_dist()
       Fix an overflow-before-widening warning in find_print_block_rg()
       Fix overflow-before-widen coverity warnings
       Fix uninitialized memory coverity warnings
       Annotate "overrun" coverity false-positive warnings
       Update translation template
       Prepare for version 3.5.0

Fabio M. Di Nitto (3):
       build: use c99 code build option
       build: clean up test/Makefile.am
       build: allow testvol location to be configurable.

Sergei Trofimovich (1):
       gfs2/edit: always use "%s"-style format for printf()-style functions

