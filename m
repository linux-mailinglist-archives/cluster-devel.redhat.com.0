Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A91C225FAE9
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Sep 2020 15:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599483661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2pewtwhGCn5UjJhcpgxTdw8lVIT6YHbcI8bprOpCJYU=;
	b=ME2uNU1JJZaGQDgazHSXzIJ0mfe0HNpTfz4j3mb4zWUAziq/qhaIV+gpawxKCvicmIx0VJ
	ivbLCaY+npoqioHxxFQEEPpY7cE8K6h2Jge347jo23PFpexHbvo7XkeYWkXLsHrZYUlJvF
	kHWTBAtcD4dqxW4lZtDCLvLOxoA9va8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-USEFHo6KMaOFRqCa3ZDvdw-1; Mon, 07 Sep 2020 09:00:59 -0400
X-MC-Unique: USEFHo6KMaOFRqCa3ZDvdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D12851800D42;
	Mon,  7 Sep 2020 13:00:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75CA57FB96;
	Mon,  7 Sep 2020 13:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C618379DD1;
	Mon,  7 Sep 2020 13:00:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 087D0kpq016462 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 09:00:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCCE47B9F4; Mon,  7 Sep 2020 13:00:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21B0171775;
	Mon,  7 Sep 2020 13:00:43 +0000 (UTC)
To: Valentin Vidic <vvidic@debian.org>
References: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
	<20200903223932.GK8773@valentin-vidic.from.hr>
	<06377e85-04f1-d828-9e75-d81629fcd59c@redhat.com>
	<20200904061827.GL8773@valentin-vidic.from.hr>
	<ef84ca52-ea0b-ecda-b1b8-2d33a4480c83@redhat.com>
	<20200904174205.GQ8773@valentin-vidic.from.hr>
From: Andrew Price <anprice@redhat.com>
Message-ID: <077d4fb3-5642-f050-f68c-fb23964c3e02@redhat.com>
Date: Mon, 7 Sep 2020 14:00:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904174205.GQ8773@valentin-vidic.from.hr>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [ClusterLabs] gfs2-utils 3.3.0 released
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 04/09/2020 18:42, Valentin Vidic wrote:
> On Fri, Sep 04, 2020 at 02:42:10PM +0100, Andrew Price wrote:
>> I'm pretty sure I know which change added the bug, but my Debian sparc64 vm
>> is hitting this problem too frequently to test:
>>
>> https://lkml.org/lkml/2020/5/18/1455
>>
>> So probably the best I can do is build with -Wcast-align=strict and make the
>> relevant warning go away.
> 
> I tried to reproduce the problem on arm, but after a rebuild tests look
> fine, so I'm not sure anymore if this is a new problem or something that
> happens randomly.

It should be consistent if it's the same alignment issue, I think. 
Perhaps the build machines are different flavours of arm?

> For sparc64 it seems to be reproducible and I have access to a machine
> in case you want me to test some patches.

Could you give this one a try:

https://pagure.io/gfs2-utils/c/eb102019?branch=andyp-restore-init-align

Andy

