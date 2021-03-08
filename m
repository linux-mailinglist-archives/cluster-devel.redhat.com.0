Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C30723312B2
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Mar 2021 16:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615219124;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jvUckjVqVssJzFle1tvH+qCSmGn0LMOPZt3ta4pKOQc=;
	b=ie39umpcx9MPdjUivD1j2hI7eNSjxPGNoZxDglmVqeJPnnAIfShiURRKSLDzSxLULO+dJZ
	vC9ffv2xxwml6XShGU/dZbuh8z7tsAqibmrLKJjC5YQy7V85BAI7cXpqwoO3YEyypfuBEE
	LdVJSnNtLTo9vkCEI77jo74QUlJXLlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-ZBtSaQS3Oe28FMHRP7qNtA-1; Mon, 08 Mar 2021 10:58:43 -0500
X-MC-Unique: ZBtSaQS3Oe28FMHRP7qNtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9A62801814;
	Mon,  8 Mar 2021 15:58:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A79336A90E;
	Mon,  8 Mar 2021 15:58:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C340D1809C86;
	Mon,  8 Mar 2021 15:58:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128FwXDD016714 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 10:58:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6C73104C45A; Mon,  8 Mar 2021 15:58:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.38] (unknown [10.33.36.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1C32101F513;
	Mon,  8 Mar 2021 15:58:20 +0000 (UTC)
To: cluster-devel@redhat.com, users@clusterlabs.org
From: Andrew Price <anprice@redhat.com>
Message-ID: <7c173954-a974-1fc0-60a6-c5d841419c76@redhat.com>
Date: Mon, 8 Mar 2021 15:58:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] gfs2-utils 3.4.0 released
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

A small yet significant release this time. gfs2 support for fs format 
1802 has been merged into the upstream kernel in the 5.12 merge window, 
so this release keeps gfs2-utils current with that development. Format 
1802 adds support for 'trusted.*' xattrs in gfs2 and enables the 
'rgrplvb' feature by default.

When gfs2-utils is built against a gfs2_ondisk.h kernel header that 
defines the fs format as 1802, mkfs.gfs2 will now create filesystems 
with that format by default. This can be overriden using the '-o 
format=1801' option. tunegfs2 can also now upgrade a filesystem to this 
format and fsck.gfs2 recognises it too.

Other than that, we have a sprinkling of cleanups and bug fixes, and the 
unit tests have been restructured. The full list of changes is below.

Grab the release tarball from:

https://releases.pagure.org/gfs2-utils/gfs2-utils-3.4.0.tar.gz

Please report bugs at:

https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=gfs2

Cheers,
Andy


gfs2-utils changes since 3.3.0:

Alexander Aring (1):
       mkfs.gfs2: make are_you_sure EOF happy

Andrew Price (18):
       Update version string for dev
       restoremeta: Fix unaligned access in restore_init()
       libgfs2: Don't define TRUE or FALSE in libgfs2.h
       Reorganise unit tests
       Stub out unit tests for the main gfs2-utils
       Describe the unit tests in README.tests
       mkfs.gfs2: Make sure the last rg_skip is 0
       Add gcov output files to .gitignore
       savemeta: Progress reporting cleanup
       mkfs.gfs2: Only call exit() from main()
       gfs2_jadd: Only call exit() from main()
       mkfs.gfs2: Check for negative -j option
       mkfs.gfs2: Add extended option for specifying format version
       fsck.gfs2: Enable checking of format 1802
       tunegfs2: Add support for fs format versions
       mkfs.gfs2: Remove a stray semicolon
       mkfs.gfs2: Remove some posix_fadvise calls
       Update version to 3.4.0

