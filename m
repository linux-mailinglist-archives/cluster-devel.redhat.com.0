Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5F65113C79A
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 16:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579102032;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZP/tkIKANNh/BmfV2JlL40RVE/JeYH7OK4syAqUkb7E=;
	b=FNqxnb+iL/N1ntqIyCUWKjm75WfmJnD/fQUxwmVk/A9UlWbdvAqXSaIhVHa8oW2ZStLp8Z
	CWcMQNWCALvd/mLBhLp2w18sb64WFaTG9P6OYtJQ2RKT6R30RkBm736oDLm7XTTFdO1nB6
	iRtWZYPdQz6V9F+qQ4OGL2xdjjMPskI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-nONvIaxPNb-IRasiivgytw-1; Wed, 15 Jan 2020 10:27:11 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AC6D10BB67D;
	Wed, 15 Jan 2020 15:27:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1A731000232;
	Wed, 15 Jan 2020 15:27:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EEC618089CD;
	Wed, 15 Jan 2020 15:27:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FFQxPZ012293 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 10:26:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C8078842B9; Wed, 15 Jan 2020 15:26:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.62] (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73535675AE;
	Wed, 15 Jan 2020 15:26:55 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>, Steven Whitehouse <swhiteho@redhat.com>
References: <20200115084956.7405-1-agruenba@redhat.com>
	<d7d86bca-522a-48f5-bee3-bae50cd04485@redhat.com>
	<CAHc6FU6UrNOenH6swABCOU2ZTh5NUfns-QeA29PSDsMwxFA1sQ@mail.gmail.com>
	<62faa428-a933-4848-d897-deb038078ac3@redhat.com>
	<1946139195.2641427.1579094357901.JavaMail.zimbra@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <4d437cff-13b5-fbeb-6f17-e5ac1cc08441@redhat.com>
Date: Wed, 15 Jan 2020 15:26:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1946139195.2641427.1579094357901.JavaMail.zimbra@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: nONvIaxPNb-IRasiivgytw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2020 13:19, Bob Peterson wrote:
> ----- Original Message -----
>> Hi,
>>
>> On 15/01/2020 09:24, Andreas Gruenbacher wrote:
>>> On Wed, Jan 15, 2020 at 9:58 AM Steven Whitehouse <swhiteho@redhat.com>
>>> wrote:
>>>> On 15/01/2020 08:49, Andreas Gruenbacher wrote:
>>>>> There's no point in sharing the internal structure of lock value blocks
>>>>> with user space.
>>>> The reason that is in ondisk is that changing that structure is
>>>> something that needs to follow the same rules as changing the on disk
>>>> structures. So it is there as a reminder of that,
>>> I can see a point in that. The reason I've posted this is because Bob
>>> was complaining that changes to include/uapi/linux/gfs2_ondisk.h break
>>> his out-of-tree module build process. (One of the patches I'm working
>>> on adds an inode LVB.) The same would be true of on-disk format
>>> changes as well of course, and those definitely need to be shared with
>>> user space. I'm not usually building gfs2 out of tree, so I'm
>>> indifferent to this change.
>>>
>>> Thanks,
>>> Andreas
>>>
>> Why would we need to be able to build gfs2 (at least I assume it is
>> gfs2) out of tree anyway?
>>
>> Steve.
> 
> Simply for productivity. The difference is this procedure, which literally takes 10 seconds,
> if done simultaneously on all nodes using something like cssh:
> 
> make -C /usr/src/kernels/4.18.0-165.el8.x86_64 modules M=$PWD

I'd be concerned about this generating "chimera" modules that produce 
invalid test results.

> rmmod gfs2
> insmod gfs2.ko
> 
> Compared to a procedure like this, which takes at least 30 minutes:
> 
> make (a new kernel .src.rpm)
> scp or rsync the .src.rpm to a build machine
> cd ~/rpmbuild/
> rpm --force -i --nodeps /home/bob/*kernel-4.18.0*.src.rpm &> /dev/null
> echo $?
> rpmbuild --target=x86_64 -ba SPECS/kernel.spec
> ( -or- submit a "real" kernel build)
> then wait for the kernel build
> Pull down all necessary kernel rpms
> scp <those rpms> to all the nodes in the cluster
> rpm --force -i --nodeps <those rpms>
> /sbin/reboot all the nodes in the cluster
> wait for all the nodes to reboot, the cluster to stabilize, etc.

Isn't the next-best alternative just building the modules in-tree and 
copying them to the test machines? I'm not sure I understand the 
complication.

Perhaps we need cluster_install and cluster_modules_install rules in the 
build system :)

Andy

