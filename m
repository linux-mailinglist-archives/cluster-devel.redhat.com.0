Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B072466C540
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Jan 2023 17:04:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673885041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=M6rJJ24zVHhCgjLNtllan0zwiI21ftv6O3aUsFmLdLY=;
	b=GdTU5QBiE7aRLv8oD9G9wcDnjTa9CXerLopvYt1wkeTZwFJ7Y6wz17OS/WFNQYJW1ymqqJ
	k3OoGTCtNeaNwFUVINuUVtmlRv7qb1zjBwVvMN4auCTpRqTiBNiYJgVhx6dX+T5CGB/RDL
	vfARlLmJNIi3o72mibUXwNTE1mvga5U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-u3MzBBs-ORO6Vzrb6lY3KQ-1; Mon, 16 Jan 2023 11:03:58 -0500
X-MC-Unique: u3MzBBs-ORO6Vzrb6lY3KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6988E3C025D1;
	Mon, 16 Jan 2023 16:03:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DFB04010D46;
	Mon, 16 Jan 2023 16:03:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E619194658D;
	Mon, 16 Jan 2023 16:03:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C420C1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 16:03:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A911C53AA; Mon, 16 Jan 2023 16:03:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A15E551FF
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 16:03:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BF683C025C1
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 16:03:55 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-sLD5dCw_M8SF2GYuqOgrvQ-1; Mon, 16 Jan 2023 11:03:54 -0500
X-MC-Unique: sLD5dCw_M8SF2GYuqOgrvQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m9-20020a056402430900b0049ca14dc2aaso5794241edc.16
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 08:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M6rJJ24zVHhCgjLNtllan0zwiI21ftv6O3aUsFmLdLY=;
 b=ZT+OaR4qAZc+ABxrOsXRBDOKiuFoosM1bECqFux8+v+jlweb1DDgZ8BGVClbHfl66J
 INapT7HkDignWkeVR1SOQrA/jrQd1dHUPlBbMW99YYv0Rgz0Qg2bHg9+Fn7HjUKZmxSE
 DSZaQ94O2VcWNlVDpXV/yeQA3A0ebUWkORBy34+KVShGbEeszxzLW/+2uuObjmDLVG78
 RvuKJPuQJJQ5FadKWkyXR6N8K0aVpB+y+l3W8nbPHENgOMs8au26cqlJLZUj3n7k+MTr
 63CRdumhoXGsqyY70wC5oAW1AzME4ISBg1nFJ336fH5zW8XwuBG7ERFa2zssgkh7hI7N
 tCoA==
X-Gm-Message-State: AFqh2koAGjEMhk+N+dq7KqWHqlYX+ufZfOKTtFDsrhHwpR/VYRKgTsRG
 oDK4hf6URTEvDWIxV5C/6OgFRwCUniau6prUONYHJb2TrZdcniAUepwbU7DUKOJGmdnUKAxDubq
 wrDLbvcgLYIFeB9dABA7O5KSculQxyZam5+Nszw==
X-Received: by 2002:a17:906:49d5:b0:7c0:bc68:c00a with SMTP id
 w21-20020a17090649d500b007c0bc68c00amr12565867ejv.665.1673885033203; 
 Mon, 16 Jan 2023 08:03:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv+/EZZNEgUhcV8IyIXUVLdBoW9iMhHcwaT33qhapdJWqC174uAKvTLmACXeFVGBPKUTH3CkwUruIwU0nsd+KA=
X-Received: by 2002:a17:906:49d5:b0:7c0:bc68:c00a with SMTP id
 w21-20020a17090649d500b007c0bc68c00amr12565865ejv.665.1673885033049; Mon, 16
 Jan 2023 08:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20230113224357.2756856-1-aahringo@redhat.com>
 <4ef0115691e1c70f55f85b33fb10642d5bb6f790.camel@redhat.com>
 <CAK-6q+hW6wcBRJg=VfDF0BwXDXriwcrTiOGTWa7363M3FWPJsg@mail.gmail.com>
In-Reply-To: <CAK-6q+hW6wcBRJg=VfDF0BwXDXriwcrTiOGTWa7363M3FWPJsg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 16 Jan 2023 11:03:41 -0500
Message-ID: <CAK-6q+gfta2F97uU5vBxYZ-YfPdnT9vAsY-MkMNSBH5NdQj_LQ@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jan 16, 2023 at 9:26 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Mon, Jan 16, 2023 at 5:36 AM Steven Whitehouse <swhiteho@redhat.com> wrote:
> >
> > Hi,
> >
> > On Fri, 2023-01-13 at 17:43 -0500, Alexander Aring wrote:
> > > When I did test with dlm_locktorture module I got several log
> > > messages
> > > about:
> > >
> > > uevent message has 3 args: add@/module/dlm_locktorture
> > > uevent message has 3 args: remove@/module/dlm_locktorture
> > >
> > > which are not expected and not able to parse by dlm_controld
> > > process_uevent() function, because mismatch of argument counts.
> > > Debugging it more, I figured out that those uevents are for
> > > loading/unloading the dlm_locktorture module and there are uevents
> > > for
> > > loading and unloading modules which have nothing todo with dlm
> > > lockspace
> > > uevent handling.
> > >
> > > The current filter works as:
> > >
> > > if (!strstr(buf, "dlm"))
> > >
> > I think that is the problem. If you want to filter out all events
> > except those sent by the DLM module, then you need to look at the
> > variables sent along with the request. Otherwise whatever string you
> > look for here might appear in some other random request from a
> > different subsystem. The event variables are much easier to parse than
> > the actual event string...
> >
> > See a similar example in decode_uevent(), etc here:
> >
> > https://github.com/andyprice/gfs2-utils/blob/91c3e9a69ed70d3d522f5b47015da5e5868722ec/group/gfs_controld/main.c
> >
> > There are probably nicer ways of doing that, than what I did there, but
> > it makes it is easier to get at the variables that are passed with the
> > notification, than to try and parse the first line of the response,
>
> This requires us to switch to the kernel uevent trigger function call
> from kobject_uevent() [0] to kobject_uevent_env() [1], because we
> don't have those envs like SUBSYSTEM being sent right now.
> I was curious because I was sure that I printed out the "raw string"
> from udev netlink socket and didn't see those envs, otherwise I
> probably would use it if I saw those. Now I figured out we need to
> have a UAPI change for that.
>
> Unfortunately, for me it looks like older dlm_controld versions cannot
> handle such change.

after Steven mentioned to me that kobject_uevent() calls
kobject_uevent_env(), I saw that there is the SUBSYSTEM environment,
etc. in there after the first nul terminated string.
I will send a v2 based on the gfs2_controld parser to not parse the
first "offline@/kernel/dlm/locktorture" string anymore and get each
field by its env which works as a key-value pair.

- Alex

