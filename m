Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4415A143B24
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jan 2020 11:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579603078;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WV6Lg38wOal3AbXSk8qOqGDpmwLbjlN0lq0ruGx65KE=;
	b=VWwaabsBkURWyT4v1YofqJ0npneXdwgSZr/IfPMOEm8uARxWgLCRQ7UU5R8+OL8r+AjNFx
	0VTyiYpz3SOFrH8CSNsc5aqoWTZTtIstDD//iC172Y3fiygtRmXDmBqlxc0cWH/aWhCaLz
	Oi2rawt8m9FAErsiijS1C0VSl0g4LTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-ul86CabXOIupLnsAHhAa-Q-1; Tue, 21 Jan 2020 05:37:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8FEE805EC3;
	Tue, 21 Jan 2020 10:37:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 958111001901;
	Tue, 21 Jan 2020 10:37:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79E6F18089C8;
	Tue, 21 Jan 2020 10:37:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LASNHJ004908 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 05:28:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2DC2110D18F3; Tue, 21 Jan 2020 10:28:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2968810D18F1
	for <cluster-devel@redhat.com>; Tue, 21 Jan 2020 10:28:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 292E0101D228
	for <cluster-devel@redhat.com>; Tue, 21 Jan 2020 10:28:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R991e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04396;
	MF=alex.shi@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0ToHg3hQ_1579602492;
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-56-_hpBT-KVPymj6WZ2IpFOqQ-1;
	Tue, 21 Jan 2020 05:28:17 -0500
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
	fp:SMTPD_---0ToHg3hQ_1579602492) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 21 Jan 2020 18:28:13 +0800
To: =?UTF-8?Q?Andreas_Gr=c3=bcnbacher?= <andreas.gruenbacher@gmail.com>
References: <1579596552-257820-1-git-send-email-alex.shi@linux.alibaba.com>
	<CAHpGcMJ6DazJ_rMPB2uUKfH-1oxVy=RoLvt2nMEvcdWWCnWjDw@mail.gmail.com>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <e29431c1-1dfc-5e65-fa43-829184ed7209@linux.alibaba.com>
Date: Tue, 21 Jan 2020 18:26:24 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAHpGcMJ6DazJ_rMPB2uUKfH-1oxVy=RoLvt2nMEvcdWWCnWjDw@mail.gmail.com>
X-MC-Unique: _hpBT-KVPymj6WZ2IpFOqQ-1
X-MC-Unique: ul86CabXOIupLnsAHhAa-Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00LASNHJ004908
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 Jan 2020 05:36:16 -0500
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] fs/gfs2: remove IS_DINODE
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A8 2020/1/21 =E4=B8=8B=E5=8D=886:23, Andreas Gr=C3=BCnbacher =E5=86=
=99=E9=81=93:
> Alex,
>=20
> Am Di., 21. Jan. 2020 um 09:50 Uhr schrieb Alex Shi
> <alex.shi@linux.alibaba.com>:
>> After commit 1579343a73e3 ("GFS2: Remove dirent_first() function"), this
>> macro isn't used any more. so remove it.
>>
>> Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
>> Cc: Bob Peterson <rpeterso@redhat.com>
>> Cc: Andreas Gruenbacher <agruenba@redhat.com>
>> Cc: cluster-devel@redhat.com
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  fs/gfs2/dir.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
>> index eb9c0578978f..636a8d0f3dab 100644
>> --- a/fs/gfs2/dir.c
>> +++ b/fs/gfs2/dir.c
>> @@ -74,7 +74,6 @@
>>  #include "util.h"
>>
>>  #define IS_LEAF     1 /* Hashed (leaf) directory */
>> -#define IS_DINODE   2 /* Linear (stuffed dinode block) directory */
>=20
> The same is true for the IS_LEAF macro. I'm adjusting the patch according=
ly.
>=20

I oversee this. Sorry.

> The other patch removing the LBIT macros looks good as well, so I'm
> applying both.

Thanks a lot!
Alex


