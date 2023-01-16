Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 156A966C230
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Jan 2023 15:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673879266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0SKBIL42rolc9xi6pHa3Sznl8cybQisZueWP72uxQOA=;
	b=R1nOgcY0IdtEa23XDOOHGQvztYFZ5s1ERNlGECSg15crgEQyt0ThydAyczcyDr5EG6HsVq
	D4DB6QsKEUhzhiOIe/1A5xsCENMcCDE5U6lpjKdBWpG3paha9yNi1I3ZslEjo3yKwb2mzJ
	Rd/KSkeQLI8kkKlOh/1hBHDAdDmrBtY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-JhoiTY1SP2udFRLy3CteTw-1; Mon, 16 Jan 2023 09:27:31 -0500
X-MC-Unique: JhoiTY1SP2udFRLy3CteTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8214E100F826;
	Mon, 16 Jan 2023 14:27:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5B7492B00;
	Mon, 16 Jan 2023 14:27:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53E291946595;
	Mon, 16 Jan 2023 14:27:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DAE031946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 14:27:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5677C15BAD; Mon, 16 Jan 2023 14:27:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE5BBC15BA0
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 14:27:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 926CB1C29D4E
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 14:27:10 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-355-I9UHJzicMZG2Tw3wLyjQ9A-1; Mon, 16 Jan 2023 09:27:09 -0500
X-MC-Unique: I9UHJzicMZG2Tw3wLyjQ9A-1
Received: by mail-ed1-f70.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso19209373edd.14
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 06:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SKBIL42rolc9xi6pHa3Sznl8cybQisZueWP72uxQOA=;
 b=PTIHrQTH9gbUjDtd+bAbNM2gZwPEG8wMPlietgKvGEtG0bSMhyU7HpfNWfBWT34BRh
 YOkZKD3bY+NrTv30DLOB53bMMr8EoZ0sLKF4gK0ZcjrkPgW+DK7mtj1te4KX0P9cmAkx
 8orycY0PfxzftzMTYDVIzPhtaq1pBkiQZQJyJVxhjHoCpXbH2paOLxZL2HIvmR7SlKPZ
 udI/Y6Y9QQVQxn2MV/Bha9tx9VYeI20+lpPjVTw65LXGvDjIXyl9wIVQwXMqfK4IF+eK
 hkNGpKjB6IL6xuykEUDMT6kgEOe2N6L6F90B6mEcIZ3VZK93IkKCpx30iilZsGkeZT9A
 TAKw==
X-Gm-Message-State: AFqh2kri/JdCYjqfwPokMyOSlvEUfrzb2Lixn1nWz137nq3Si/M+SKvi
 1SQ9l42DJLPrQw/K5BiKnq8ntI4US9BgSu7JTJP1cRKMIG8/pd6Z0+IxNWlSNYglAGEWRxSsqDU
 aszW50U8Z/j5qK9hZTQe8Z500p/3YqseFifF3oA==
X-Received: by 2002:a17:907:918a:b0:85f:68bf:265a with SMTP id
 bp10-20020a170907918a00b0085f68bf265amr1254608ejb.278.1673879227873; 
 Mon, 16 Jan 2023 06:27:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsa0MkwDZMveJYxiUMa3GRbgeRaXNHQriSJ48Wn9vFcXGuqKvqOSwFxWtvnWmtEwkUCerhfuptO75sHnqeUjRc=
X-Received: by 2002:a17:907:918a:b0:85f:68bf:265a with SMTP id
 bp10-20020a170907918a00b0085f68bf265amr1254605ejb.278.1673879227718; Mon, 16
 Jan 2023 06:27:07 -0800 (PST)
MIME-Version: 1.0
References: <20230113224357.2756856-1-aahringo@redhat.com>
 <4ef0115691e1c70f55f85b33fb10642d5bb6f790.camel@redhat.com>
In-Reply-To: <4ef0115691e1c70f55f85b33fb10642d5bb6f790.camel@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 16 Jan 2023 09:26:56 -0500
Message-ID: <CAK-6q+hW6wcBRJg=VfDF0BwXDXriwcrTiOGTWa7363M3FWPJsg@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH dlm-tool] dlm_controld: better uevent
 filtering
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jan 16, 2023 at 5:36 AM Steven Whitehouse <swhiteho@redhat.com> wrote:
>
> Hi,
>
> On Fri, 2023-01-13 at 17:43 -0500, Alexander Aring wrote:
> > When I did test with dlm_locktorture module I got several log
> > messages
> > about:
> >
> > uevent message has 3 args: add@/module/dlm_locktorture
> > uevent message has 3 args: remove@/module/dlm_locktorture
> >
> > which are not expected and not able to parse by dlm_controld
> > process_uevent() function, because mismatch of argument counts.
> > Debugging it more, I figured out that those uevents are for
> > loading/unloading the dlm_locktorture module and there are uevents
> > for
> > loading and unloading modules which have nothing todo with dlm
> > lockspace
> > uevent handling.
> >
> > The current filter works as:
> >
> > if (!strstr(buf, "dlm"))
> >
> I think that is the problem. If you want to filter out all events
> except those sent by the DLM module, then you need to look at the
> variables sent along with the request. Otherwise whatever string you
> look for here might appear in some other random request from a
> different subsystem. The event variables are much easier to parse than
> the actual event string...
>
> See a similar example in decode_uevent(), etc here:
>
> https://github.com/andyprice/gfs2-utils/blob/91c3e9a69ed70d3d522f5b47015da5e5868722ec/group/gfs_controld/main.c
>
> There are probably nicer ways of doing that, than what I did there, but
> it makes it is easier to get at the variables that are passed with the
> notification, than to try and parse the first line of the response,

This requires us to switch to the kernel uevent trigger function call
from kobject_uevent() [0] to kobject_uevent_env() [1], because we
don't have those envs like SUBSYSTEM being sent right now.
I was curious because I was sure that I printed out the "raw string"
from udev netlink socket and didn't see those envs, otherwise I
probably would use it if I saw those. Now I figured out we need to
have a UAPI change for that.

Unfortunately, for me it looks like older dlm_controld versions cannot
handle such change.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/dlm/lockspace.c?h=v6.2-rc4#n200
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/kobject_uevent.c?h=v6.2-rc4#n447

