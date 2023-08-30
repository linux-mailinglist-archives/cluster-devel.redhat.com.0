Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169978D5FF
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Aug 2023 15:00:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693400401;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v2sZJy7coZxAVZRyjBbEYGHy7Fw4aLyn9Mmqx4qqxfs=;
	b=WlBW+tUCF0SBPOVnfmDcY9PoRoKCDvG3SNdmMqqfTb8nWOcqDycmN9aMWSDGSqLAp+X7aW
	UVgCPDFafDVEghxQy9gA2iOq+y0Y7W+WbM4cNPcic3oGjKujPlNG7bHYiMnDaNJGaPRwuG
	EJ4o2yOcISIGp+gTuKM+c+W9V6a6pwE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-0ArkNP5iPFWMmJyv0Dh6DA-1; Wed, 30 Aug 2023 08:59:58 -0400
X-MC-Unique: 0ArkNP5iPFWMmJyv0Dh6DA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1B168028B2;
	Wed, 30 Aug 2023 12:59:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D68E51121315;
	Wed, 30 Aug 2023 12:59:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A70FB19465B3;
	Wed, 30 Aug 2023 12:59:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 646311946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 12:39:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3FF24492C18; Wed, 30 Aug 2023 12:39:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38D88492C14
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 12:39:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 100701C06924
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 12:39:09 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-9lIpe_LMN5mQLf-VRbbYlQ-1; Wed, 30 Aug 2023 08:39:07 -0400
X-MC-Unique: 9lIpe_LMN5mQLf-VRbbYlQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-52a3e9c53e7so4367494a12.3
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 05:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693399146; x=1694003946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2sZJy7coZxAVZRyjBbEYGHy7Fw4aLyn9Mmqx4qqxfs=;
 b=OlbkfXHHPD3SuCSbaJRIYB+xmLIyXZCY4bSvmdePe9VtOjzI200ZFCvcnoSmOY5j2R
 Rex2+mdj5aec5rmnh69jFLhthPnNrd0O71jXCflEGOz1qxvFpufL2e74DaizCUwIZMzA
 z+il1D5XHSroWhhrFaQ5Z7CX+fVCDXdAUlQeNVhijYfb0zbGA02jRZdmSrTOFBBah9EH
 5aE0sWDRLhxpxcHaOjkZNRKrwBxG2cBRgQQ+Q4N6EyYX9N4/VlxFqgvHnHQTP7xvxMDo
 AkUaZnoUP9Wg0OnsjjRK8k4YPTx7DPWDAWqZZIkrFYLW6QIjv4vxuFOz/uVB0FaGVn8o
 IkmA==
X-Gm-Message-State: AOJu0Yz9sZkA+R3hizkha1i9lfqKrXuyVQEEK62CaQZXxywgHas34NgM
 aEW2hWnKEaPB8WFOcbbJHBeuP3CWqZRVMwS3XcbLjVWG1do/1aw9CqRXzZTWcxdAZeO0t6kpVZN
 /FaDpfXx5omtvFangSzstdTuO1KoLRCjRsMdFaLEljKPkTQ==
X-Received: by 2002:a50:ef1a:0:b0:51b:c714:a2a1 with SMTP id
 m26-20020a50ef1a000000b0051bc714a2a1mr1972656eds.7.1693399146289; 
 Wed, 30 Aug 2023 05:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfewQayRTjS+ETA5KSggFgeSlv49VrL0zQXHu5OfkWiTGdWkUo1JPaTBQ/aMX8Dt5k7rGTtcbDWOy5lMZ3Qew=
X-Received: by 2002:a50:ef1a:0:b0:51b:c714:a2a1 with SMTP id
 m26-20020a50ef1a000000b0051bc714a2a1mr1972643eds.7.1693399146053; Wed, 30 Aug
 2023 05:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-7-aahringo@redhat.com>
 <9a8ead64cdd32fdad29cae3aff0bd447f33a32c2.camel@kernel.org>
In-Reply-To: <9a8ead64cdd32fdad29cae3aff0bd447f33a32c2.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 30 Aug 2023 08:38:54 -0400
Message-ID: <CAK-6q+i+j1TUmWGH+fdYHix5TwujH8_kuR5ayUv9h6Ah8OQecQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 6/7] dlm: use FL_SLEEP to determine
 blocking vs non-blocking
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 25, 2023 at 2:18=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Wed, 2023-08-23 at 17:33 -0400, Alexander Aring wrote:
> > This patch uses the FL_SLEEP flag in struct file_lock to determine if
> > the lock request is a blocking or non-blocking request. Before dlm was
> > using IS_SETLKW() was being used which is not usable for lock requests
> > coming from lockd when EXPORT_OP_SAFE_ASYNC_LOCK inside the export flag=
s
> > is set.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/dlm/plock.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > index 0094fa4004cc..0c6ed5eeb840 100644
> > --- a/fs/dlm/plock.c
> > +++ b/fs/dlm/plock.c
> > @@ -140,7 +140,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 =
number, struct file *file,
> >       op->info.optype         =3D DLM_PLOCK_OP_LOCK;
> >       op->info.pid            =3D fl->fl_pid;
> >       op->info.ex             =3D (fl->fl_type =3D=3D F_WRLCK);
> > -     op->info.wait           =3D IS_SETLKW(cmd);
> > +     op->info.wait           =3D !!(fl->fl_flags & FL_SLEEP);
> >       op->info.fsid           =3D ls->ls_global_id;
> >       op->info.number         =3D number;
> >       op->info.start          =3D fl->fl_start;
>
> Not sure you really need the !!, but ok...
>

The wait is a byte value and FL_SLEEP doesn't fit into it, I already
run into problems with it. I don't think somebody does a if (foo->wait
=3D=3D 1) but it should be set to 1 or 0.

An alternative would be: ((fl->fl_flags & FL_SLEEP) =3D=3D FL_SLEEP). I am
not sure what the coding style says here. I think it's more important
what the C standard says about !!(condition), but there are other
users of this in the Linux kernel. :-/

- Alex

