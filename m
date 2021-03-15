Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0A0733AFFC
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Mar 2021 11:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615804255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7LDgByFJVBAWzt+2ZMQwBAuinf/q/hC7HBE3YTGOx5g=;
	b=ii8JuQ5WWUX+CvC9uSp+ptxwG+iLt40nPLR09Va1CxJGtER+4imfumZ0pfeZjY7DRE3Ncg
	0qHI+Kdk+B2Z3n2AJjWoqHiue1qE3rYkQc2pjVhW8suQuRhslnlNLWU8eueLMvmjAu4D/u
	gaujFKB5puvx0ixc6Idi5HmL41iV3hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-WXfsn4GkPeCtljyeXQPNGg-1; Mon, 15 Mar 2021 06:30:53 -0400
X-MC-Unique: WXfsn4GkPeCtljyeXQPNGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CE9D107ACCA;
	Mon, 15 Mar 2021 10:30:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C1C619D7C;
	Mon, 15 Mar 2021 10:30:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 882831800B72;
	Mon, 15 Mar 2021 10:30:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12FAUeQR012351 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 15 Mar 2021 06:30:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5575E1F445; Mon, 15 Mar 2021 10:30:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.36.115.218] (ovpn-115-218.ams2.redhat.com [10.36.115.218])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9513E19D7C;
	Mon, 15 Mar 2021 10:30:36 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com, users@clusterlabs.org
Message-ID: <f792370f-4214-8a54-2b38-437ed76ae51d@redhat.com>
Date: Mon, 15 Mar 2021 10:30:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] gfs2-utils 3.4.1 released
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

In testing it was discovered that gfs2-utils 3.4.0 was missing a fix for 
a case where, when fsck.gfs2 is built against Linux 5.12 (not yet 
released) kernel headers, and an old-format gfs2 filesystem is being 
checked, fsck.gfs2 can fail to recognise the superblock as valid.

To prevent fsck.gfs2 failures that could be caused by that issue, 
gfs2-utils 3.4.1 is now available.

The release tarball is here:

https://releases.pagure.org/gfs2-utils/gfs2-utils-3.4.1.tar.gz

Please report bugs at:

https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=gfs2

Cheers,
Andy


gfs2-utils changes since 3.4.0:

Alexander Aring (2):
       glocktop: use MAX_LINES for dlmwlines
       glocktop: allocate fsdlm dynamically

Andrew Price (3):
       Update version string for dev
       libgfs2: Fix a format version check in check_sb()
       Prepare for version 3.4.1

