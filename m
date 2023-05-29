Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9648F7151CE
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 00:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685398939;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rb9/kQafNSw5KkGFRQissHuGR3PHQTnYmFgaKvIovMw=;
	b=DDtt7aFuoSx5V1yLQtD0uZK9lwbJEjl7wNw7AF7QpqVeauSXOCoWEhdrug2qe376oqOb56
	YThLQYZlXtLPg3czVbeCIJB9NLPJKBLhGdlYoLMefOWEvKIQa2jcrudAboCN2i5l/24gxb
	YiunHOJ9J5giTUgxAfQydC5cQcoZoK8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-hQO1eZ--OO2m_YdZbobeGg-1; Mon, 29 May 2023 18:21:13 -0400
X-MC-Unique: hQO1eZ--OO2m_YdZbobeGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C88B0185A78B;
	Mon, 29 May 2023 22:21:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCECBC154D1;
	Mon, 29 May 2023 22:21:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 81A5D19465A2;
	Mon, 29 May 2023 22:21:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7380A194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 22:21:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54BF3C154D2; Mon, 29 May 2023 22:21:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C708C154D1
 for <cluster-devel@redhat.com>; Mon, 29 May 2023 22:21:11 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29DC78007D9
 for <cluster-devel@redhat.com>; Mon, 29 May 2023 22:21:11 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-4fR6lmwxMXCSqVotKQ1xNg-1; Mon, 29 May 2023 18:21:09 -0400
X-MC-Unique: 4fR6lmwxMXCSqVotKQ1xNg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-513f5318ff2so2913298a12.3
 for <cluster-devel@redhat.com>; Mon, 29 May 2023 15:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685398868; x=1687990868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rb9/kQafNSw5KkGFRQissHuGR3PHQTnYmFgaKvIovMw=;
 b=P+e47k8BGGI+aTEy8+NqzotUNzZqTLoFknPRJdwwEf7yQOoiu6SVmW/kRWDulQlNdK
 T38ydlWKK112DLyY5jiq7Ryyste2skkxnYfvjHxvjO06Ku0SFD2LXoA0F2ABuNypHSBu
 Oxk+YjzrkdizqXjQafkEiOd/nh+H+yfDUrmhjgQa0uzMHqXTjtPRwLs2XIA47G22Ke6Q
 wA2asayKyolhJW3ZuC0l5gdlxzC8vFg6CXAwXyk1CrUIFrnKgM4v+9GccdnO3Wepgh/n
 AF3NFF98gywgvsUj2O3umzcy3C1KCfdTZowBSVHSTOwkRPS0ZnNfIr7yvgS5fNdyEQTj
 QQSQ==
X-Gm-Message-State: AC+VfDxqPMGHRhG4oQc/I6CQwuAX3koDE1ApoIJUWwK7qErtpsdpb9My
 b56iAtin3/nf4jEmVZOo4+W+mg+QpCOd6LWclCTM6QvHmTgnbpjRCTnpa602ODm2PZ6XjtJtBs7
 wTaH2Or7IBz9Meip1oVny24PiiBWc5Z18coSMYA==
X-Received: by 2002:aa7:d846:0:b0:50b:d553:3822 with SMTP id
 f6-20020aa7d846000000b0050bd5533822mr170474eds.7.1685398868623; 
 Mon, 29 May 2023 15:21:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6F+8vzrwPvjCHivMbN9Zp/PZqfxoXtGQjfrQ42SbwJjDwcnVogt6/bYIfcNuLtYG5GchK0GvUNhgnBreNsfP8=
X-Received: by 2002:aa7:d846:0:b0:50b:d553:3822 with SMTP id
 f6-20020aa7d846000000b0050bd5533822mr170468eds.7.1685398868396; Mon, 29 May
 2023 15:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
 <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
 <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
In-Reply-To: <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 29 May 2023 18:20:57 -0400
Message-ID: <CAK-6q+hhQM_4aP_FQPZCX9dQQMD550vAXnSBFpExCt6JiqwrOQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: avoid F_SETLKW
 plock op lookup collisions
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 29, 2023 at 6:18=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> Hi,
>
> On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aahringo@redha=
t.com> wrote:
> > > This patch fixes a possible plock op collisions when using F_SETLKW l=
ock
> > > requests and fsid, number and owner are not enough to identify a resu=
lt
> > > for a pending request. The ltp testcases [0] and [1] are examples whe=
n
> > > this is not enough in case of using classic posix locks with threads =
and
> > > open filedescriptor posix locks.
> > >
> > > The idea to fix the issue here is to place all lock request in order.=
 In
> > > case of non F_SETLKW lock request (indicated if wait is set or not) t=
he
> > > lock requests are ordered inside the recv_list. If a result comes bac=
k
> > > the right plock op can be found by the first plock_op in recv_list wh=
ich
> > > has not info.wait set. This can be done only by non F_SETLKW plock op=
s as
> > > dlm_controld always reads a specific plock op (list_move_tail() from
> > > send_list to recv_mlist) and write the result immediately back.
> > >
> > > This behaviour is for F_SETLKW not possible as multiple waiters can b=
e
> > > get a result back in an random order. To avoid a collisions in cases
> > > like [0] or [1] this patch adds more fields to compare the plock
> > > operations as the lock request is the same. This is also being made i=
n
> > > NFS to find an result for an asynchronous F_SETLKW lock request [2][3=
]. We
> > > still can't find the exact lock request for a specific result if the
> > > lock request is the same, but if this is the case we don't care the
> > > order how the identical lock requests get their result back to grant =
the
> > > lock.
> >
> > When the recv_list contains multiple indistinguishable requests, this
> > can only be because they originated from multiple threads of the same
> > process. In that case, I agree that it doesn't matter which of those
> > requests we "complete" in dev_write() as long as we only complete one
> > request. We do need to compare the additional request fields in
> > dev_write() to find a suitable request, so that makes sense as well.
> > We need to compare all of the fields that identify a request (optype,
> > ex, wait, pid, nodeid, fsid, number, start, end, owner) to find the
> > "right" request (or in case there is more than one identical request,
> > a "suitable" request).
> >
>
> In my "definition" why this works is as you said the "identical
> request". There is a more deeper definition of "when is a request
> identical" and in my opinion it is here as: "A request A is identical
> to request B when they get granted under the same 'time'" which is all
> the fields you mentioned.

s/under/at/

at the same 'time' or under the same conditions...

- Alex

