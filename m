Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9A936E1771
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Oct 2019 12:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571825576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6/DHIg7plKeEx4VD4kGbxDb/2fCb9UAZFB3sVf2CDVY=;
	b=hFZWXUlhEk+H1kycd1KbjA2U7G2TJc6BDt6p+nBPz5YSHYpN8/Au3Y6PIMti27+9imeRlJ
	NsfqsNGKAusV4/O0nZHg0bi60jKLA9NWveJ1YP2ANlTDM4cU6ZuRODCJ3WYun1yaAnhdoe
	SuM6cKbA0JghKtQ63rtsbxdXQot13L0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-PVay8KL4OH-9mM1hVDjexw-1; Wed, 23 Oct 2019 06:12:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD1847B;
	Wed, 23 Oct 2019 10:12:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDE6A60624;
	Wed, 23 Oct 2019 10:12:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 335044EDA6;
	Wed, 23 Oct 2019 10:12:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9NACewj019185 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 06:12:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F7B260126; Wed, 23 Oct 2019 10:12:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.109] (unknown [10.33.36.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A59D4600CC
	for <cluster-devel@redhat.com>; Wed, 23 Oct 2019 10:12:37 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
References: <000000000000afc1b40593f68888@google.com>
	<20191003153552.2015-1-anprice@redhat.com>
	<824921067.4882112.1570209623167.JavaMail.zimbra@redhat.com>
	<e6c80348-1bd1-bb02-0089-1ed836821fb8@redhat.com>
Message-ID: <d661db99-b610-f000-1acb-6e4fc633f1b5@redhat.com>
Date: Wed, 23 Oct 2019 11:12:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <e6c80348-1bd1-bb02-0089-1ed836821fb8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix memory leak when gfs2meta's
 fs_context is freed
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
X-MC-Unique: PVay8KL4OH-9mM1hVDjexw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09/10/2019 07:36, Andrew Price wrote:
> On 04/10/2019 18:20, Bob Peterson wrote:
>> ----- Original Message -----
>>> gfs2 and gfs2meta share an ->init_fs_context function which allocates a=
n
>>> args structure stored in fc->fs_private. gfs2 registers a ->free
>>> function to free this memory when the fs_context is cleaned up, but
>>> there was not one registered for gfs2meta, causing a leak.
>>>
>>> Register a ->free function for gfs2meta. The existing gfs2_fc_free
>>> function does what we need.
>>>
>>> Reported-by: syzbot+c2fdfd2b783754878fb6@syzkaller.appspotmail.com
>>> Signed-off-by: Andrew Price <anprice@redhat.com>
>>> ---
>>
>> Thanks. Now pushed to for-next.
>=20
> Thanks Bob. Can we get this sent to Linus as a fix during this cycle?
>=20
> Andy
>=20

It might need a

Fixes: 1f52aa08d12f8d359e71b4bfd73ca9d5d668e4da

That commit went upstream during this cycle's merge window so if we can=20
get the fix upstream before release we won't have to worry about stable.

Andy

