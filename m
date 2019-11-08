Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2B530F43DC
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Nov 2019 10:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573206616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GC1kPqh18YLaP55egUAwTq8H8gO5XXIKsxZXAmviRd8=;
	b=U5Pl+euQFHY79uSCOpkyFuZ8OWD8GbrVs/NOSOAdoTi921tdV6qaFE8AAm6LIR/rgbSNzK
	Errnj3awQBKo/E8H5iPZnIBEVV1Ih2CD6tJfvyfPaF9fEtgjIdAHa457XvInYp141agwm6
	k1ifCd02XmUGsYSGC3LmvnsW9wJSVZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-X5ofjgpbN7asxnYoNV-AoA-1; Fri, 08 Nov 2019 04:50:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51E0D1800D7B;
	Fri,  8 Nov 2019 09:50:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AFA460850;
	Fri,  8 Nov 2019 09:50:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB4E94BB65;
	Fri,  8 Nov 2019 09:50:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA89o5dU023765 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 04:50:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E4834600CA; Fri,  8 Nov 2019 09:50:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.157] (unknown [10.33.36.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D392600C9;
	Fri,  8 Nov 2019 09:50:01 +0000 (UTC)
To: Christoph Hellwig <hch@infradead.org>
References: <20190409094153.3343-1-anprice@redhat.com>
	<20190409120304.GA16296@infradead.org>
	<e19c558c-76d0-4b7f-c7e9-7375e72c9ace@redhat.com>
	<58b0f320-407b-bae0-d261-9182b3b5912c@redhat.com>
	<20190409123510.GA27246@infradead.org>
From: Andrew Price <anprice@redhat.com>
Message-ID: <8967ad5b-2a4c-ddba-2386-fff7533458fc@redhat.com>
Date: Fri, 8 Nov 2019 09:50:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190409123510.GA27246@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] libgfs2: Import gfs2_ondisk.h
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
X-MC-Unique: X5ofjgpbN7asxnYoNV-AoA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Revisiting this...

On 09/04/2019 13:35, Christoph Hellwig wrote:
> On Tue, Apr 09, 2019 at 01:21:23PM +0100, Steven Whitehouse wrote:
>> Those conversion functions are not sensible, thats why we got rid of the=
m
>> from the kernel code. It is better to have a set of types that have the
>> endianess specified so that we can use sparse. Compile time checking is
>> always a good plan where it is possible.
>=20
> Yeah.  And <linux/types.h> vs inttypes.h is no argument either,
> you can define the __be types based on the inttypes.h types (which
> really are stdint.h ones anyway).

Linux's __be* type definitions are pulled in by standard headers (e.g.=20
sys/stat.h via bits/statx.h -> linux/stat.h -> linux/types.h) so they=20
can't be redefined in terms of stdint.h types, unfortunately. Even if=20
that did work it could easily be broken outside of our control in the=20
future, so that's another reason to leave the __be* types alone.

So I think the best we can do is define some new bitwise-annotated types=20
based on stdint.h and change the imported gfs2_ondisk.h to use them.

Andy

