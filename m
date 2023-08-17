Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5137C77EECC
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Aug 2023 03:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692236452;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rGPGNEzA8Hg+gJfsuH3mJv5XgBkB6580SnI6Dwb6wrw=;
	b=chIB7vBajtHpv1HZyPr6j+/gfZjMdoSznSBg7n3lUQBMnip7raPOkKLqbYUud5A0onyv9s
	JZyir4m/W59FJcrDFDt91p/PJBtcuG41g+awA4D4YXdqMPzl5ZBhXxyaKyzijqDWtYFJxp
	Tvw8d4FwwUdqOdQPNus4+nQXANlfCCc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-sMP7YAkeM2m36UcTmj_Aww-1; Wed, 16 Aug 2023 21:40:45 -0400
X-MC-Unique: sMP7YAkeM2m36UcTmj_Aww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DAB0280FEC1;
	Thu, 17 Aug 2023 01:40:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8641040C207A;
	Thu, 17 Aug 2023 01:40:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 58DB4194658C;
	Thu, 17 Aug 2023 01:40:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 237EB1946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Aug 2023 01:40:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 002C240C207C; Thu, 17 Aug 2023 01:40:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED53E40C207A
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 01:40:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8B7C85CBE6
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 01:40:42 +0000 (UTC)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-Zd6o8R9FMoC92-f7ZHsbzA-1; Wed, 16 Aug 2023 21:40:40 -0400
X-MC-Unique: Zd6o8R9FMoC92-f7ZHsbzA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4fe3fb358easo7069468e87.2
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 18:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692236439; x=1692841239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGPGNEzA8Hg+gJfsuH3mJv5XgBkB6580SnI6Dwb6wrw=;
 b=V+iGQC2F74bDCnrp/awVZacgyJgZ4wNoY4WpkyrcCzs1tEMtuKPKjzVRJNWaZhzeYG
 yDwpirDaegeS3qvBboMy+darSkcNOyFdKTxclHF9I1aUHa5mQ/nUo43Y0Kin1w51d4Yx
 pHdi6TchN0oQbJ18sMVbWmMvy+23o8IqleFl7fV1k/7/T4rqkmz72txHrucuBpMqSUC5
 WGTDURXNh59N0cwSoHvYg96GckDc/wwkQQn3k/f8EJR41D9nYVrTaV5jEBEHbF55Tfwv
 9DWkAEo+TKN098Uiluctcu5UvAOZred0o65FbheFXLdnomlI+ubPlejQcwNOENmYgksX
 HOZA==
X-Gm-Message-State: AOJu0Yxzz5Ws0is02W+pAkORjfTDuri6QOAVJNm1jWO08ZEFCi83F6iJ
 CBnhLqKt0BzkpDKGAyCxsgGGcH30Ez+49B0j+6vi4JpuDtqM9JwXq0oe5z1U4hsNyzY0Oq6IzEW
 /ImXrsK6T8ruSWLZZuQBew4H1GjvgTprOKXrIMg==
X-Received: by 2002:ac2:484a:0:b0:4fe:5741:9eb9 with SMTP id
 10-20020ac2484a000000b004fe57419eb9mr2727709lfy.49.1692236439458; 
 Wed, 16 Aug 2023 18:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsSIql+75kR7a5m8JTNViEr2cmNnzGfqdvDezYuFdF9VjvJ+ASCYtLmcFjsXpowRAIWWGgSOCedDvWY+l9uUo=
X-Received: by 2002:ac2:484a:0:b0:4fe:5741:9eb9 with SMTP id
 10-20020ac2484a000000b004fe57419eb9mr2727704lfy.49.1692236439181; Wed, 16 Aug
 2023 18:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-3-aahringo@redhat.com>
 <88ec807d16a7eb2be252eea0c10e3374c01da1bf.camel@kernel.org>
In-Reply-To: <88ec807d16a7eb2be252eea0c10e3374c01da1bf.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 16 Aug 2023 21:40:27 -0400
Message-ID: <CAK-6q+iqQFXKXEbxy+k=NF5mOp7H+NTzo3_3uBCQszmufryJeQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [RFCv2 2/7] lockd: FILE_LOCK_DEFERRED only on
 FL_SLEEP
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
Cc: linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 ocfs2-devel@lists.linux.dev, chuck.lever@oracle.com, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 16, 2023 at 7:37=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> > This patch removes to handle non-blocking lock requests as asynchronous
> > lock request returning FILE_LOCK_DEFERRED. When fl_lmops and lm_grant()
> > is set and a non-blocking lock request returns FILE_LOCK_DEFERRED will
> > end in an WARNING to signal the user the misusage of the API.
> >
>
> Probably need to rephrase the word salad in the first sentence of the
> commit log. I had to go over it a few times to understand what was going
> on here.
>

ok. I will go over it again.

> In any case, I'm guessing that the idea here is that GFS2/DLM shouldn't
> ever return FILE_LOCK_DEFERRED if this is a non-wait request (i.e.
> someone called F_SETLK instead of F_SETLKW)?
>

Yes, non-wait requests (meaning trylock) does not return
FILE_LOCK_DEFERRED. I added in some patch a WARN_ON() if this would be
the case.

However I mentioned in other patches there is this mismatch between
F_SETLK from lockd and figure out if it's wait and non-wait if
FL_SLEEP is set, but somehow if it's not coming from lockd (lm_grant
is not set) it's going over the cmd if it's F_SETLKW. So far I
understand DLM should never make this decision over the F_SETLK vs
F_SETLKW it should always check on FL_SLEEP. I can change it to use
FL_SLEEP only.


> That may be ok, but again, lockd goes to great lengths to avoid blocking
> and I think it's generally a good idea. If an upcall to DLM can take a
> long time, it might be a good idea to continue to allow a !wait request
> to return FILE_LOCK_DEFERRED.
>

In the case of DLM there is no difference between upcall/downcall if
lockd does other operations like unlock/cancellation requests. We
don't do the optimization there, why are we doing it for !wait
requests... but okay I can change it.

> I guess this really depends on the current behavior today though. Does
> DLM ever return FILE_LOCK_DEFERRED on a non-blocking lock request?
>

I change it so that it doesn't do it, but I can change it !wait
requests will return FILE_LOCK_DEFERRED and be handled asynchronously.

- Alex

