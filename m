Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC74F8A83
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Apr 2022 02:09:24 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-BE8_1VFgMhO8Qm0e0vuWkQ-1; Thu, 07 Apr 2022 20:09:20 -0400
X-MC-Unique: BE8_1VFgMhO8Qm0e0vuWkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4829811E78;
	Fri,  8 Apr 2022 00:09:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F184BC27E86;
	Fri,  8 Apr 2022 00:09:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 978451940342;
	Fri,  8 Apr 2022 00:09:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C13DE1949761 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 00:09:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AA84D7AF5; Fri,  8 Apr 2022 00:09:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A66D37AE4
 for <cluster-devel@redhat.com>; Fri,  8 Apr 2022 00:09:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F312280005D
 for <cluster-devel@redhat.com>; Fri,  8 Apr 2022 00:09:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-qeImiSKCNK6Ebx3oPkYOaA-1; Thu, 07 Apr 2022 20:09:08 -0400
X-MC-Unique: qeImiSKCNK6Ebx3oPkYOaA-1
Received: by mail-wr1-f50.google.com with SMTP id w21so10512386wra.2;
 Thu, 07 Apr 2022 17:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=PfNmVPJPOYhZo6mM9f4K9oOc3fjfxWYYQ/iwukBRnhg=;
 b=bUKGULiEqLr9clmC1xAoE7MD4zEnBN7y/ukKAwrnjQVLYp69u3WDpOaYjTMMfO+XRw
 R81HuOvqBjFpvQJgvJWbWtxWEsloXeQkval0zyWUUIK0ALN4LkwT4DNC+4n32JNztB0s
 YgbZ9Y7mIcpiHHWVWSw8Kzt3sEMYhDvoFufQIP6Ld1XOPlppu7lfiQ6QsGAnhALSY5eh
 ZDfAHncUE7sqHNDrcVVwzdO2o/cODVCfJQCCEMXqzVWGD71MKB0skvKtWz6BXTstvCjU
 eYN278kwz0fgRSdCtNPiTrn+oE+ccBkoZp/ckTjfmeMKr2i3IjGooFzKsKNlXLjrgMwf
 uc9A==
X-Gm-Message-State: AOAM531PDYlXXw9tBABF9vPPmGCDDwuEg0Y2qnWdwv+W6Vu2Lvhl/eQW
 B/XmAB1cgxeWlXs7kDluJS1qp4Zj0hYa8Kl4
X-Google-Smtp-Source: ABdhPJyQWpXvBLKy9TL/68rPekbZXgqMOHgyXrxVRabA+akeP5vXPiWlRy91wCTHuYYPWMFbtkdNwA==
X-Received: by 2002:a5d:6c65:0:b0:204:119d:37e2 with SMTP id
 r5-20020a5d6c65000000b00204119d37e2mr12255514wrz.635.1649376546646; 
 Thu, 07 Apr 2022 17:09:06 -0700 (PDT)
Received: from smtpclient.apple ([185.238.38.242])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm20728387wrs.73.2022.04.07.17.09.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Apr 2022 17:09:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <CAHc6FU4s952rPPsceefvZER8dPM9RVWyQrmneMyqaW_0oViFSA@mail.gmail.com>
Date: Fri, 8 Apr 2022 02:09:05 +0200
Message-Id: <0EB429B0-8A2F-4247-8F84-F6A78BD030F0@gmail.com>
References: <20220331223857.902911-1-jakobkoschel@gmail.com>
 <CAHc6FU4s952rPPsceefvZER8dPM9RVWyQrmneMyqaW_0oViFSA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 1/2] gfs2: remove usage of list iterator
 variable for list_for_each_entry_continue()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: LKML <linux-kernel@vger.kernel.org>, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 cluster-devel <cluster-devel@redhat.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Mike Rapoport <rppt@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On 4. Apr 2022, at 16:58, Andreas Gruenbacher <agruenba@redhat.com> wrote=
:
>=20
> Hi Jakob,
>=20
> On Fri, Apr 1, 2022 at 12:40 AM Jakob Koschel <jakobkoschel@gmail.com> wr=
ote:
>> In preparation to limiting the scope of a list iterator to the list
>> traversal loop, use a dedicated pointer to iterate through the list [1].
>>=20
>> Since that variable should not be used past the loop iteration, a
>> separate variable is used to 'remember the current location within the
>> loop'.
>>=20
>> To either continue iterating from that position or start a new
>> iteration (if the previous iteration was complete) list_prepare_entry()
>> is used.
>=20
> I can see how accessing an iterator variable past a for_each_entry
> loop will cause problems when it ends up pointing at the list head.

Well, as long as you only use it to access the list head, there
should be no problem, hence no bug.

The issue are more the cases that use other members of that 'bogus'
pointer and there were plenty of such cases [1].
That's why the goal is to "not use the iterator variable after the loop"
so the scope can be lowered and such cases are avoided by construction.

> Here, the iterator variables are not accessed outside the loops at
> all, though. So this patch is ugly, and it doesn't even help.

I do agree that this patch is ugly. I'm open to suggestions on how to
improve the code allowing to lower the scope of 'bd1' to the traversal
loop. But I don't agree that the iterator variables are not used outside
of the loops. (If with loops you mean the list traversals).

The iterator variables are not used "after" in terms of code location but
since it's wrapped by a while loop they are used "after" in regards of
execution time.
From the second iteration of the while loop onwards, it will used the
leftover 'bd1' pointer from the previous iterations list traversal, hence
using the variables "outside of the traversal loops". Lowering the scope
will not be possible because of this.

>=20
>> Link: https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5SqX=
Pwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>> ---
>> fs/gfs2/lops.c | 16 ++++++++++++----
>> 1 file changed, 12 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
>> index 6ba51cbb94cf..74e6d05cee2c 100644
>> --- a/fs/gfs2/lops.c
>> +++ b/fs/gfs2/lops.c
>> @@ -653,7 +653,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp,=
 unsigned int limit,
>> bool is_databuf)
>> {
>> struct gfs2_log_descriptor *ld;
>> - struct gfs2_bufdata *bd1 =3D NULL, *bd2;
>> + struct gfs2_bufdata *bd1 =3D NULL, *bd2, *tmp1, *tmp2;
>> struct page *page;
>> unsigned int num;
>> unsigned n;
>> @@ -661,7 +661,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp,=
 unsigned int limit,
>>=20
>> gfs2_log_lock(sdp);
>> list_sort(NULL, blist, blocknr_cmp);
>> - bd1 =3D bd2 =3D list_prepare_entry(bd1, blist, bd_list);
>> + tmp1 =3D tmp2 =3D list_prepare_entry(bd1, blist, bd_list);
>=20
> We should actually be using list_entry() here, not list_prepare_entry().

I'm not sure if you are referring to using list_entry() here in the origina=
l or
in the changed version.

I don't see how that would be much better in either cases. 'bd1' can be NUL=
L in both cases
which would break when simply using list_entry(). In the original code, 'bd=
1' would
be NULL for the first iteration of the while loop and in the updated versio=
n it
would be NULL in the first iteration + every time the list traversal in the=
 previous
iteration did not break early.

Just using 'bd1 =3D list_entry(bd1, blist, bd_list);' when initializing wou=
ld work
in the original code.
But it's not solving the scope issue where 'bd1' is used outside of the lis=
t
traversal loop.

>=20

[1] https://lore.kernel.org/linux-kernel/20220308171818.384491-1-jakobkosch=
el@gmail.com/

Thanks,
Jakob

