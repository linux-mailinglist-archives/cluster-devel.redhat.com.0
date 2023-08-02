Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78976D0AB
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Aug 2023 16:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690988134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YYS01Utz4O72MYPiyYMfnrHn/zyOxv67iVW/CUYNGGw=;
	b=Yg90P1PS/fq2LV1Pj69YlTDU+KaQ+arv11liZfxVoj8qL9CeD+X3oglfRxFHZEYvdEhcJI
	6oCihXhcRsssvUHamavTcCaDWGKxriIIIkF4GRVtdLFnbGbEwioOEVG3jLsaOieQiQtYbP
	FbbNVV0zr6H4QEscH7FRZzgQhLZ1VL8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-0vJV4QkYNwi4npq1ffGqcA-1; Wed, 02 Aug 2023 10:55:31 -0400
X-MC-Unique: 0vJV4QkYNwi4npq1ffGqcA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00F121C06919;
	Wed,  2 Aug 2023 14:55:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C5AE401EA9B;
	Wed,  2 Aug 2023 14:55:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 140701946A79;
	Wed,  2 Aug 2023 14:55:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 365F11946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Aug 2023 14:55:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2699540C206F; Wed,  2 Aug 2023 14:55:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FAF840C2063
 for <cluster-devel@redhat.com>; Wed,  2 Aug 2023 14:55:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00D4984B162
 for <cluster-devel@redhat.com>; Wed,  2 Aug 2023 14:55:27 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-KU-KBZehO1yFxlJTkkSscA-1; Wed, 02 Aug 2023 10:55:25 -0400
X-MC-Unique: KU-KBZehO1yFxlJTkkSscA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1bbdced15f3so70660345ad.2
 for <cluster-devel@redhat.com>; Wed, 02 Aug 2023 07:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690988124; x=1691592924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYS01Utz4O72MYPiyYMfnrHn/zyOxv67iVW/CUYNGGw=;
 b=e/3y0YSbkp4afDonr6jxXPZW2tMIKtO6CdbJDdchInZdm05L3Oas1P21Sc2yn9WFWD
 NFlhv9C+cCCXNPcD9ayNGUt8l7T5vJUd/UneQgTJx5ToGa/G1CRDcpXwLzXAz4AvCsAq
 uldgKMixMaXwEM6lOgIu4M8qx9m57/unlRS6+NhDV8OXIK4U7UpqAmMsbiZ9nQ3sMCOY
 DH3OLaahy5nE1G6V7SCqpJIMZnVTVxKlQE9XymBLT2n5F1nLLb2YzFTcb26iyxXaQWzx
 cxGb1YiLOhOcMfp3IKV+ULyI8l/liVZrKdz/HL8MqfN3EuowRPUJnHkmVI0yrSfGbedX
 a3cw==
X-Gm-Message-State: ABy/qLY66aF5kQQZg0ffXW1HNeaOuh2j0m8xZKJ9G5af/lvduSdsSkSz
 psjyuMmBQfXdP+uec76WWtSleSxD8rAThsQTinWywompbVhtZEMx0sOk5hwsWNZ+biSUbIYpj53
 CQCxXMmvm05vXLovU6slCFFInAqQLHiTmVwszbQ==
X-Received: by 2002:a17:902:db08:b0:1b8:a19e:a3d3 with SMTP id
 m8-20020a170902db0800b001b8a19ea3d3mr19478587plx.52.1690988124667; 
 Wed, 02 Aug 2023 07:55:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE3v17OlcpgEOv4q55ylnh+X9JThVQaNeze9lcGAJmdFYCttjU9FJ0oUHAtfLIhM6F0I6+KWo0S7CTSxnwjCGs=
X-Received: by 2002:a17:902:db08:b0:1b8:a19e:a3d3 with SMTP id
 m8-20020a170902db0800b001b8a19ea3d3mr19478566plx.52.1690988124329; Wed, 02
 Aug 2023 07:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <2e4e8d5b-f653-4900-ac68-34018c9f7145@moroto.mountain>
In-Reply-To: <2e4e8d5b-f653-4900-ac68-34018c9f7145@moroto.mountain>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 2 Aug 2023 16:55:12 +0200
Message-ID: <CAHc6FU6Api-SYojTgATpVPEtuDfwTiqV7E=zJ3xbD=khevNj-A@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [bug report] gfs2: Use mapping->gfp_mask for
 metadata inodes
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 9:35=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
> Hello Andreas Gruenbacher,
>
> The patch 8f18190e3173: "gfs2: Use mapping->gfp_mask for metadata
> inodes" from Jul 26, 2023 (linux-next), leads to the following Smatch
> static checker warning:
>
>         fs/gfs2/inode.c:286 gfs2_lookup_simple()
>         error: 'inode' dereferencing possible ERR_PTR()
>
> fs/gfs2/inode.c
>     268 struct inode *gfs2_lookup_simple(struct inode *dip, const char *n=
ame)
>     269 {
>     270         struct qstr qstr;
>     271         struct inode *inode;
>     272         gfs2_str2qstr(&qstr, name);
>     273         inode =3D gfs2_lookupi(dip, &qstr, 1);
>     274         /* gfs2_lookupi has inconsistent callers: vfs
>     275          * related routines expect NULL for no entry found,
>     276          * gfs2_lookup_simple callers expect ENOENT
>     277          * and do not check for NULL.
>
> This comment is ancient.  I think how gfs2_lookupi() works is that if
> there is an error it returns an error code, but if the file does not
> exist it returns NULL.  (This is just based on vague assumptions about
> how mixed error pointer/NULL functions work).
>
>     278          */
>     279         if (inode =3D=3D NULL)
>     280                 return ERR_PTR(-ENOENT);
>     281
>     282         /*
>     283          * Must not call back into the filesystem when allocating
>     284          * pages in the metadata inode's address space.
>     285          */
> --> 286         mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
>                                      ^^^^^^^^^^^^^^^^
> error pointer dereference

Ah, right, thanks for pointing this out. I've pushed a fix.

Andreas

>     287
>     288         return inode;
>     289 }
>
> regards,
> dan carpenter

