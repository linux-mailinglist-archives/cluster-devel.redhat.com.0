Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDCB75D216
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 20:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689965757;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WmfrP9wFQnzZhw2fgBYIX25txWh2pY7hccaj8FMORPE=;
	b=NRS+JpcKln94A++QxcWmgr33NOYqRLQGV6OkzDD8+8aUEWMUbAZap/bRbBPJ4Uy3Wm+mSN
	OX6D86z0suoTSLpQUq4UCjtDga+P2sj7wCC1SN17kV2u10jSsNP6yT2s39U0NTV8BNw5pD
	+asah+URovESmX+iy7Adv73Lzrc2H58=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-rtH4uzjLMTmf1sVLOAkwsw-1; Fri, 21 Jul 2023 14:55:54 -0400
X-MC-Unique: rtH4uzjLMTmf1sVLOAkwsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DB671C05154;
	Fri, 21 Jul 2023 18:55:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42B6740C6F4F;
	Fri, 21 Jul 2023 18:55:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE9661946A49;
	Fri, 21 Jul 2023 18:55:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60DF41946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 18:55:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4E771C5796A; Fri, 21 Jul 2023 18:55:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46B37C57969
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 18:55:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26E3D281BDD2
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 18:55:50 +0000 (UTC)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-yQ_jeZ3eNMOEQquMUqb24g-1; Fri, 21 Jul 2023 14:55:49 -0400
X-MC-Unique: yQ_jeZ3eNMOEQquMUqb24g-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-57704aace46so23293207b3.2
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 11:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689965733; x=1690570533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WmfrP9wFQnzZhw2fgBYIX25txWh2pY7hccaj8FMORPE=;
 b=X0B1nPbIsFd1N7fLCit5c1/mLTCd94cRpvm+/tlNrphqIhNIdbuJmwwb32190FQMh9
 fAhlms3B3KwijP8NO9HwjSvUYdLYxhh22MGfP8Vd8LWLpkt5n+/9+vaKzRMBetU4665N
 VspTqgwjOjwnOgZ134gY3PohKQOiWtfZZ/rxplXUVTkmGvN4rBrgH+uPkih4m5+Cnv+v
 6isG2xlmgGyeFJywUnkbwayJNn+g7lB9q3pjdqBUOeSdYTHHWiuseVhQ1ODyolqqT6Yl
 riW2IbnI608kl3ni5tcLmoaClbg4kV8IosfuRbb0hWaBgKcJJVIiqw5pNDVgTaTqF+PK
 BZlw==
X-Gm-Message-State: ABy/qLb9KncY+4N/tfpTdFga9+vUgpLPQjPrSXop+h7XnoNImkw6X2mm
 IVe8Pi8KgGrE05brJrHSxJG8cLcNOm8XMtxtJDZ42G1XsUwcLEv4q8ISOdwxiSf0Tfgh4Dj3Xit
 YQwenTtG3fOk2dCLK1HXAA2ppWvIUjroW4OER/w==
X-Received: by 2002:a0d:fd07:0:b0:576:82d7:7a with SMTP id
 n7-20020a0dfd07000000b0057682d7007amr910757ywf.43.1689965733107; 
 Fri, 21 Jul 2023 11:55:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGevb5kv0fBPECk7NzSGvdtLJpMPwyJt3JcupTlSWAnsiNjsQGICzI6cCohgZb5URbW/YliXZ6JX7KxpPyOwjw=
X-Received: by 2002:a0d:fd07:0:b0:576:82d7:7a with SMTP id
 n7-20020a0dfd07000000b0057682d7007amr910744ywf.43.1689965732703; 
 Fri, 21 Jul 2023 11:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230720122241.1381845-1-aahringo@redhat.com>
 <20230720122241.1381845-4-aahringo@redhat.com>
 <CAHc6FU6nHjx2JQn=1_zif-gLFZQHZfwb5E8HHXHcYn67_VV0SQ@mail.gmail.com>
In-Reply-To: <CAHc6FU6nHjx2JQn=1_zif-gLFZQHZfwb5E8HHXHcYn67_VV0SQ@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 21 Jul 2023 14:55:21 -0400
Message-ID: <CAK-6q+g01Xu+DZN3asom9VHAbBfwvEAO2_Eu8kXHJiuCyhtvEQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCHv4 v6.5-rc2 3/3] fs: dlm: fix F_CANCELLK
 to cancel pending request
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

Hi,

On Fri, Jul 21, 2023 at 12:25=E2=80=AFPM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> On Thu, Jul 20, 2023 at 2:22=E2=80=AFPM Alexander Aring <aahringo@redhat.=
com> wrote:
> > This patch fixes the current handling of F_CANCELLK by not just doing a
> > unlock as we need to try to cancel a lock at first. A unlock makes sens=
e
> > on a non-blocking lock request but if it's a blocking lock request we
> > need to cancel the request until it's not granted yet. This patch is fi=
xing
> > this behaviour by first try to cancel a lock request and if it's failed
> > it's unlocking the lock which seems to be granted.
>
> I don't like how this is implemented, but the problem already starts
> in commit 57e2c2f2d94c ("fs: dlm: fix mismatch of plock results from
> userspace"). That commit relies on how dlm_controld is implemented
> internally; it requires dlm_controld to keep all replies to
> non-blocking requests in perfect order. The correctness of that
> approach is more difficult to argue for than it should be, the code
> might break in non-obvious ways, and it limits the kinds of things
> dlm_controld will be able to do in the future. And this change relies
> on the same flawed design.
>

I agree it is not the best design and I mentioned it in my previous
patch series versions [0]:

TODO we should move to a instance reference from request and reply and
not go over lock states, but it seems going over lock states and get
the instance does not make any problems (at least there were no issues
found yet) but it's much cleaner to not think about all possible
special cases and states to instance has no 1:1 mapping anymore.

> Instead, when noticing that we don't have a way to uniquely identify
> requests, such a way should just have been introduced. The CANCEL
> request would then carry the same unique identifier as the original
> locking request, dlm_controld would reply either to the original
> locking request or to the cancel request, and the kernel would have no
> problem matching the reply to the request.
>
> But without unique request identifiers, we now end up with those
> redundant -ENOENT replies to CANCEL requests and with those
> essentially duplicate entries for the same request on recv_list. Not
> great.
>

There is no reference of lock request instances between kernel and
user yet. It does it by having a match if it's the same lock request.
The whole mechanism works like this, but one reason why we recently
had problems with it. A lock request is the same in the sense that
they are being granted at the same time. So far we did not experience
any problems with that... but as mentioned in [0] you need to think
about all potential cases.

NOTE: that even F_CANCELLK does not give you a unique reference of the
original locking request, it works over matching the field of struct
file_lock... There is already the same problem. The struct file_lock
pointer could be used, but struct file_lock does not represent a lock
request, this does not exist in VFS posix lock API.

- Alex

[0] https://listman.redhat.com/archives/cluster-devel/2023-July/024477.html

