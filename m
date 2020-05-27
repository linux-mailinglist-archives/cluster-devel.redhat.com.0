Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 41CEC1E3F66
	for <lists+cluster-devel@lfdr.de>; Wed, 27 May 2020 12:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590576737;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w1r7qIROWgWc7cdyVeHtVJpJ3g6y6VVo76rtzRFSAwo=;
	b=U4OykA6cBr2OD+98C1RNaMwb4+YGTxp8O2YyL3V2LhrCR13HMAHPAml24vdNcfEMUfrjl0
	syvCbsIfbE58QUGHVlGfE3YdMlu23X2Wi4ULStIJp2Bu3r6lLrQfthVHnb8SIyD4Y+BZSb
	7z7Wwau5YCKWDQTbkzqiK/RzxDIbgBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-0LOBrDpxPsCqYqGF06JxAQ-1; Wed, 27 May 2020 06:52:15 -0400
X-MC-Unique: 0LOBrDpxPsCqYqGF06JxAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BE8B107ACCD;
	Wed, 27 May 2020 10:52:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3176F86C7C;
	Wed, 27 May 2020 10:52:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 222C76B499;
	Wed, 27 May 2020 10:52:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RAq8ZB032677 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 06:52:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A32760F88; Wed, 27 May 2020 10:52:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.6] (unknown [10.33.36.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90F2C60E1C;
	Wed, 27 May 2020 10:52:03 +0000 (UTC)
To: Steven Whitehouse <swhiteho@redhat.com>
References: <20200527082954.1235228-1-anprice@redhat.com>
	<38694c56-7dcb-a52e-2d12-01949c20b9bd@redhat.com>
	<535f4043-d004-c7cd-be3a-0621fd2a35ba@redhat.com>
	<a1a58f62-5eda-b9e9-8567-d10835a5c8c7@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <487ddf48-5752-67e4-f1c2-b25ff213c356@redhat.com>
Date: Wed, 27 May 2020 11:52:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1a58f62-5eda-b9e9-8567-d10835a5c8c7@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] mkfs.gfs2: Don't use optimal_io_size
 when equal to minimum
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/05/2020 11:07, Steven Whitehouse wrote:
> By default, I can't see any reason why we'd want a block sizes less than 
> 4k. We might want to allow someone to do that for special cases, but 
> generally the lower block sizes cause issue with larger file sizes, due 
> to the increased height of the metadata tree. As such we should try and 
> avoid them, and ignoring all hints of below 4k seems like a sensible plan.
> 
> If someone specifically requests a smaller block size on the command 
> line, then that is another thing, but we should try and protect people 
> from devices which advertise really small optimal I/O sizes. Really we 
> should be using that in combination with the alignment information when 
> laying out the larger structures on disk, and not using it for selecting 
> the block size - assuming again that these sizes have been set by the 
> device to something sensible in the first place,

OK, that makes sense to me. I'll redo the patch to only choose a block 
size <4K if it's specified on the command line.

Andy

