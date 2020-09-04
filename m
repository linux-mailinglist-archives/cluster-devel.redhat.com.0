Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D4A0B25DA29
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Sep 2020 15:42:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Bv6UfIYsOKKAC44dhKfp3A-1; Fri, 04 Sep 2020 09:42:34 -0400
X-MC-Unique: Bv6UfIYsOKKAC44dhKfp3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEE7B81C464;
	Fri,  4 Sep 2020 13:42:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A3C65C1DC;
	Fri,  4 Sep 2020 13:42:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A786C18561B2;
	Fri,  4 Sep 2020 13:42:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084DgEUt005907 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 09:42:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C01D960C17; Fri,  4 Sep 2020 13:42:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D467B60C0F;
	Fri,  4 Sep 2020 13:42:11 +0000 (UTC)
To: Valentin Vidic <vvidic@debian.org>
References: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
	<20200903223932.GK8773@valentin-vidic.from.hr>
	<06377e85-04f1-d828-9e75-d81629fcd59c@redhat.com>
	<20200904061827.GL8773@valentin-vidic.from.hr>
From: Andrew Price <anprice@redhat.com>
Message-ID: <ef84ca52-ea0b-ecda-b1b8-2d33a4480c83@redhat.com>
Date: Fri, 4 Sep 2020 14:42:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904061827.GL8773@valentin-vidic.from.hr>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 04/09/2020 07:18, Valentin Vidic wrote:
> On Fri, Sep 04, 2020 at 04:13:08AM +0100, Andrew Price wrote:
>> The "Bus error"s suggest it's failing on an unaligned access somewhere in
>> restoremeta, so just armhf and sparc64 are affected. I'll look into it.
> 
> Thanks, there is a lot of [-Wcast-align] warnings in the build log that
> could be relevant and don't show up on amd64. Also I don't think the
> previous 3.2.0 version had this problem with the tests:
> 
> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armhf&ver=3.2.0-3&stamp=1581778584&raw=0
> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armhf&ver=3.3.0-1&stamp=1599171965&raw=0
> 

I'm pretty sure I know which change added the bug, but my Debian sparc64 
vm is hitting this problem too frequently to test:

https://lkml.org/lkml/2020/5/18/1455

So probably the best I can do is build with -Wcast-align=strict and make 
the relevant warning go away.

Andy

