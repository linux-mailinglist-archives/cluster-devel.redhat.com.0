Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDE56AA45F
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 23:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677882684;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a0iXMm42vZSIq5xQOQQD0lUxKb9sCAcfgRukCiNG7T8=;
	b=OEkqRVcCgXEEr+D9DrYxVeX27JshC9MojuETqbc0akK+I2nJ+wImuN2/IOgIKunetNyIw6
	DPg3tjvn8FBSc4DXsF4aEoTJ6ym7n4rJRcr1Be5ZVnwMEdRIDhJpaNdm61FPhMHpTqb4sk
	Nc++3sOLaDRtMxgCmQB36Ine77yWXx4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-SpMc0GopM9KgoI0A1FPBwg-1; Fri, 03 Mar 2023 17:31:20 -0500
X-MC-Unique: SpMc0GopM9KgoI0A1FPBwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FDB6101A521;
	Fri,  3 Mar 2023 22:31:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38FC31121315;
	Fri,  3 Mar 2023 22:31:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 095F119452D0;
	Fri,  3 Mar 2023 22:31:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1678619465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 22:31:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EFACDC16029; Fri,  3 Mar 2023 22:31:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8B03C16027
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 22:31:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C49E929AB3F8
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 22:31:16 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-Rn6HBxaQNDuQihT0vhme2w-1; Fri, 03 Mar 2023 17:31:15 -0500
X-MC-Unique: Rn6HBxaQNDuQihT0vhme2w-1
Received: by mail-ed1-f70.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso5939965edb.4
 for <cluster-devel@redhat.com>; Fri, 03 Mar 2023 14:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677882674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0iXMm42vZSIq5xQOQQD0lUxKb9sCAcfgRukCiNG7T8=;
 b=spygaPQ6yRnQJ77f+5OhVC8V+6ORyy2DarUnYlClxV3SDMkyZmZqE/lixno/f/9fLJ
 h2PsuHOBBUFFlywJYl/k+Awmszlnle+n+09eiDl/sMC/zC4qqZHpMohHysiL0LCC9/pn
 sEsWoDbEM2u+J3qKcs9/HwOI+5MVdco5tRXtiL6KsvGEFsUuyTbmUZuXJSloKhZeqr3t
 AUhWsCke2I9XzVReQHVnWGXQYWXRYVPaZqDYTMawg8A65PswtqA1hioEoAyHnl8aJfDh
 X+aWfeXtmG9u75HAHJTwCMVWResXAhuwInh+ipjSRvYjM64+j/etZvgJ3vQ+9yECYvsn
 HH7Q==
X-Gm-Message-State: AO0yUKUZtHmbtQ0BM1WuKSNi82uaIDSMPXdyPzZJ62ukv6v+xjIIKxvZ
 Oaphpl9RiHRxubTGgz3Xx+Ty71zwwqIT7pxmadPgqB2QGInZes21z8leF/2WBdkvriEgIWcKX2H
 hzWbMBGWAgxvq3WjwJXTLG2PoOxOq2Mc+XamRMb0r1Qabk2cV
X-Received: by 2002:a17:906:5910:b0:8b1:78b8:4207 with SMTP id
 h16-20020a170906591000b008b178b84207mr1624348ejq.3.1677882674444; 
 Fri, 03 Mar 2023 14:31:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+VS9qRhypw8Vz3+EQvFXKC6vhNl602rmFh1vHfLH0DAQQEoJQ1ulROdzBFiqWLQffNjQsjJDJ0x+aEoEJX5f8=
X-Received: by 2002:a17:906:5910:b0:8b1:78b8:4207 with SMTP id
 h16-20020a170906591000b008b178b84207mr1624342ejq.3.1677882674144; Fri, 03 Mar
 2023 14:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20230302171441.1509914-13-aahringo@redhat.com>
 <20230303133845.801743-1-agruenba@redhat.com>
 <CAK-6q+gmTae=5xj5Noomy=aVRfwAQgD1C2WJ1=TYEjPWA76cMw@mail.gmail.com>
 <20230303155255.807862-1-agruenba@redhat.com>
In-Reply-To: <20230303155255.807862-1-agruenba@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 3 Mar 2023 17:31:02 -0500
Message-ID: <CAK-6q+gNMLn1HoFH=AqnqB=oaj8mO-qJ8gbpw4rH7b_dPxKUcQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH dlm-tool 13/14] dlm_controld: plock log
 lock state
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 3, 2023 at 10:52=E2=80=AFAM Andreas Gruenbacher <agruenba@redha=
t.com> wrote:
>
> Now, let me get to the core of the matter.  We've been talking about
> using user-space (SDT) trace points for collecting the data, and I still
> think that that's what we should do instead of introducing a new
> dlm_controld log file.  In the dlm_controld code, this would look like
> the below patch.
>
> Note that <sys/sdt.h> is part of the systemtap-sdt-devel package, so a
> "BuildRequires: systemtap-sdt-devel" dependency will be needed in
> dlm.spec.
>

ah, ok. This answers my other question I had.

> With that, we can use standard tools like perf, bpftrace, etc. for
> collecting all the relevant information without any further
> modifications to dlm_controld.  We can also collect additional kernel
> and user-space trace point data at the same time with very little
> additional effort.
>
> For example, here is how to register the four plock dlm_controld trace
> points in perf:
>
>   for ev in \
>       sdt_dlm_controld:plock_lock_begin \
>       sdt_dlm_controld:plock_lock_end \
>       sdt_dlm_controld:plock_wait_begin \
>       sdt_dlm_controld:plock_wait_end; do \
>     perf probe -x /usr/sbin/dlm_controld $ev; \
>   done
>
> The events can then be recorded with "perf record":
>
>   perf record \
>     -e sdt_dlm_controld:plock_lock_begin \
>     -e sdt_dlm_controld:plock_lock_end \
>     -e sdt_dlm_controld:plock_wait_begin \
>     -e sdt_dlm_controld:plock_wait_end \
>     [...]
>
> We've already gone through how the resulting log can be processed with
> "perf script".  One possible result would be the log file format that
> lockdb_plot expects, but there are countless other possibilities.
>
> Other useful "tricks":
>
>   $ bpftrace -l 'usdt:/usr/sbin/dlm_controld:*'
>
>   $ readelf -n /usr/sbin/dlm_controld | sed -ne '/\.note\.stapsdt/,/^$/p'
>

look easy enough.

- Alex

