Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B376F7F5E
	for <lists+cluster-devel@lfdr.de>; Fri,  5 May 2023 10:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683276581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yELUTR8vPgIirJKw3GXjozM951jrxtPkfSM13QaMJ60=;
	b=DGVmtrD1VEvTOA4NucesTYkTkaobooqjjDxESa/vbR4jOpnlGwt4uG1QfVUMBP0jq3G9IJ
	/AQ+8w9GFU3zoATAf35mNTS44GT8JPqgW63il6vC/Mofj6w4XaVWNF1sAAdTvcPiuIFFmu
	XqsnucMNOUhnbGoSfS/g8F1axTpGPHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-dfhdgljcP6e4YoPAhX0jYA-1; Fri, 05 May 2023 04:49:38 -0400
X-MC-Unique: dfhdgljcP6e4YoPAhX0jYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97769870846;
	Fri,  5 May 2023 08:49:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B691C15BA0;
	Fri,  5 May 2023 08:49:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53A3F1946A4A;
	Fri,  5 May 2023 08:49:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F7BC1946A43 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  5 May 2023 08:49:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 346061121339; Fri,  5 May 2023 08:49:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DBA61121331
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 08:49:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13A6A84AF34
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 08:49:35 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-M5jP3WfyM7K5ypTDplwMIw-1; Fri, 05 May 2023 04:49:26 -0400
X-MC-Unique: M5jP3WfyM7K5ypTDplwMIw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-61b78e49e99so7923976d6.1
 for <cluster-devel@redhat.com>; Fri, 05 May 2023 01:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683276566; x=1685868566;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yELUTR8vPgIirJKw3GXjozM951jrxtPkfSM13QaMJ60=;
 b=XB+3ciKaeD7liLjqbZaOe+fd/Vu4Sehr0O6ySf2xf73sg9CpWmbFPjYiKAFmK0AjON
 eGqRfztNBVuCC2lbbeNc2d99JTO4q6MhOc99vVkmmvOBZWdszx3mptF/7i9bta9bm3Ec
 O1doZadSPdsjqda94pTFA3lz1p3/kO/zUtYLpo372DC+DjP5iX2Z0V9WIYRrPKKnmq8o
 IOtKitamwzpM9tbRuLD6aTmgVmBJv2Rj51rAVoe3XNHXmNNeppHNJGaCOeWCosGSRbgC
 ps5ZlH6RQUci3ko592LfhM5/dH4Eo11I2R0R9Y+a/09l4PWDmZiHLQCoTENvW4dAiWhu
 CiOA==
X-Gm-Message-State: AC+VfDzR1/G6SMX3Rm4XEHpY448zlN10zlcdSBTMxLBQSU5wmTFkOcoH
 KFnRVIZ+2FQ9UJKoxtbs1yYROdiBP/zlh96M3DPB9r7vBcNiRdJklHA/eW4xJpEf5pRG4fkF4lx
 bRU3ZqkOsINdMCF8WQb99iA==
X-Received: by 2002:a05:6214:21e9:b0:5e9:752:766b with SMTP id
 p9-20020a05621421e900b005e90752766bmr887852qvj.47.1683276565761; 
 Fri, 05 May 2023 01:49:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ptNdPl2aLGUvbHYh++xmQ9zBc0uLXWnqfiaKm7X60TH4wDdr6Yoc8rfYWLOf5yKyArxN20g==
X-Received: by 2002:a05:6214:21e9:b0:5e9:752:766b with SMTP id
 p9-20020a05621421e900b005e90752766bmr887842qvj.47.1683276565445; 
 Fri, 05 May 2023 01:49:25 -0700 (PDT)
Received: from
 0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
 (0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:ffda:0:2059:8730:b2:c370])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a0cdd90000000b0061b721f27b3sm413331qvk.123.2023.05.05.01.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 01:49:24 -0700 (PDT)
Message-ID: <d402c7018cc89db0f2c7b939c7c17552c0b8219a.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Andrew Price <anprice@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Date: Fri, 05 May 2023 09:49:22 +0100
In-Reply-To: <d388a721-fac9-3b3a-497b-9aee3aec7066@redhat.com>
References: <20230504174322.384715-1-rpeterso@redhat.com>
 <d388a721-fac9-3b3a-497b-9aee3aec7066@redhat.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH] gfs2: ignore rindex_update failure in
 dinode_dealloc
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2023-05-05 at 08:44 +0100, Andrew Price wrote:
> Hi Bob,
>=20
> On 04/05/2023 18:43, Bob Peterson wrote:
> > Before this patch function gfs2_dinode_dealloc would abort if it
> > got a
> > bad return code from gfs2_rindex_update. The problem is that it
> > left the
> > dinode in the unlinked (not free) state, which meant subsequent
> > fsck
> > would clean it up and flag an error. That meant some of our QE
> > tests
> > would fail.
>=20
> As I understand it the test is an interrupted rename loop workload
> and=20
> gfs2_grow at the same time, and the bad return code is -EINTR, right?
>=20
> > The sole purpose of gfs2_rindex_update, in this code path, is to
> > read in
> > any newer rgrps added by gfs2_grow. But since this is a delete
> > operation
> > it won't actually use any of those new rgrps. It can really only
> > twiddle
> > the bits from "Unlinked" to "Free" in an existing rgrp. Therefore
> > the
> > error should not prevent the transition from unlinked to free.
> >=20
> > This patch makes gfs2_dinode_dealloc ignore the bad return code and
> > proceed with freeing the dinode so the QE tests will not be tripped
> > up.
>=20
> Is it really ok to ignore all potential errors here? I wonder if it=20
> should just ignore -EINTR (or whichever error the test produces) so
> that=20
> it can still fail well for errors like -EIO.
>=20
> Cheers,
> Andy
>=20
Perhaps the more important question is why there are errors there in
the first place?

Steve.

> >=20
> > Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> > ---
> > =C2=A0 fs/gfs2/super.c | 4 +---
> > =C2=A0 1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> > index d3b5c6278be0..1f23d7845123 100644
> > --- a/fs/gfs2/super.c
> > +++ b/fs/gfs2/super.c
> > @@ -1131,9 +1131,7 @@ static int gfs2_dinode_dealloc(struct
> > gfs2_inode *ip)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EIO;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error =3D gfs2_rindex_update=
(sdp);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (error)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return error;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gfs2_rindex_update(sdp);
>=20
>=20
>=20
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error =3D gfs2_quota_ho=
ld(ip, NO_UID_QUOTA_CHANGE,
> > NO_GID_QUOTA_CHANGE);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (error)
>=20

