Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CA57E13BCCD
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 10:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579081817;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9gVtD1aX7+wVZIqRUtmsVnDOFrxtUlEeag3NncLdquc=;
	b=PkPGoI+BvT3NP+OwmfnXVsqbvo5Ba13SU6CCp3UjjTFUTBjbfkYFHSk55MVgTKIMuJgd9M
	cwOjhcWkr7WhpF5NIP2v0Aks1q1Hvy7XL5S9a2xl2biSnfaH2zw/wX0O5opixOiN0c94Qh
	wobjKarYbRSsuFHnuVCY89eDNqjpw44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-FJfYQiaYPhC71y0SaZuPFg-1; Wed, 15 Jan 2020 04:50:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB63380256C;
	Wed, 15 Jan 2020 09:50:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2089C5C1D6;
	Wed, 15 Jan 2020 09:50:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1847A18089C8;
	Wed, 15 Jan 2020 09:50:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F9o4Sb022780 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 04:50:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 67C067E590; Wed, 15 Jan 2020 09:50:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DE48432A;
	Wed, 15 Jan 2020 09:50:00 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20200115084956.7405-1-agruenba@redhat.com>
	<d7d86bca-522a-48f5-bee3-bae50cd04485@redhat.com>
	<CAHc6FU6UrNOenH6swABCOU2ZTh5NUfns-QeA29PSDsMwxFA1sQ@mail.gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <62faa428-a933-4848-d897-deb038078ac3@redhat.com>
Date: Wed, 15 Jan 2020 09:49:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6UrNOenH6swABCOU2ZTh5NUfns-QeA29PSDsMwxFA1sQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] Move struct gfs2_rgrp_lvb out of
 gfs2_ondisk.h
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
X-MC-Unique: FJfYQiaYPhC71y0SaZuPFg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/01/2020 09:24, Andreas Gruenbacher wrote:
> On Wed, Jan 15, 2020 at 9:58 AM Steven Whitehouse <swhiteho@redhat.com> wrote:
>> On 15/01/2020 08:49, Andreas Gruenbacher wrote:
>>> There's no point in sharing the internal structure of lock value blocks
>>> with user space.
>> The reason that is in ondisk is that changing that structure is
>> something that needs to follow the same rules as changing the on disk
>> structures. So it is there as a reminder of that,
> I can see a point in that. The reason I've posted this is because Bob
> was complaining that changes to include/uapi/linux/gfs2_ondisk.h break
> his out-of-tree module build process. (One of the patches I'm working
> on adds an inode LVB.) The same would be true of on-disk format
> changes as well of course, and those definitely need to be shared with
> user space. I'm not usually building gfs2 out of tree, so I'm
> indifferent to this change.
>
> Thanks,
> Andreas
>
Why would we need to be able to build gfs2 (at least I assume it is 
gfs2) out of tree anyway?

Steve.


