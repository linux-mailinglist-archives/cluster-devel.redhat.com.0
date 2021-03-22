Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 462773452C3
	for <lists+cluster-devel@lfdr.de>; Tue, 23 Mar 2021 00:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616454413;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Vlu5m4e9WxArTe2F2AMqeH6SD3gNeSxJ1U2hmSMHs70=;
	b=FcZ0dRo37NqaWU+j4P/4xZ6WPeHFHgagaSOXiQsuvafy6djOa1kjGmJMOH02dXc+GiCaMh
	q8Kb7RF/QMapHG8NgDRd1dTyQEmp9JThww3/oEQLYSSQMl6fafE5O1h+g36b4tlavBktbl
	TNDe38sTC2kzPhtVdcsyry6DUZ1Wh58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-rHBTVhG8MIyaIxKPHqqt-w-1; Mon, 22 Mar 2021 19:06:51 -0400
X-MC-Unique: rHBTVhG8MIyaIxKPHqqt-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3022108BD07;
	Mon, 22 Mar 2021 23:06:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBB3F1851C;
	Mon, 22 Mar 2021 23:06:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AA6D4BB7B;
	Mon, 22 Mar 2021 23:06:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12MN6jQF020047 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Mar 2021 19:06:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF16E110AF3D; Mon, 22 Mar 2021 23:06:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CACEA110AF3F
	for <cluster-devel@redhat.com>; Mon, 22 Mar 2021 23:06:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BE9A85A5A8
	for <cluster-devel@redhat.com>; Mon, 22 Mar 2021 23:06:43 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-20-buFI6b6aMg2GV8BXMbcG5A-1; Mon, 22 Mar 2021 19:06:41 -0400
X-MC-Unique: buFI6b6aMg2GV8BXMbcG5A-1
Received: by mail-il1-f197.google.com with SMTP id r16so297004ilj.9
	for <cluster-devel@redhat.com>; Mon, 22 Mar 2021 16:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vlu5m4e9WxArTe2F2AMqeH6SD3gNeSxJ1U2hmSMHs70=;
	b=raQ6hrjfG3lM7BhUGQzy6rX6YTNbZ/H/kVdg9p6jbJCsvpJtM6eOtN8UXbXTKC4FGi
	90ZNu6lzLjScAGMDLbijDGXgjfE5hGRtOxqXooimOmxCCiUIsNeyAkBlW/ZxzOBRQlMX
	smrWVsZFZajO0SkSK2ZAP8qbiJvS7Kl0lJJMSvAQ4dAOU5vD1I13KZ5VOrSve5AhkBOl
	Kjfp0A9NPM/IVp5fbcYb1qTidyEUAL587cPWxcd+5rl1eJM4WPRjvYHRcCdzBouQxwD8
	yRWKyne1TmCAMnKZW/MrK3nfbN5lZyT5bAieLpcyuqDdkz8aQRWaTkvL8vsQYVZC2Tz4
	vCEw==
X-Gm-Message-State: AOAM530H4NF6HitCtwchmKWdc1NQbrnnh13uXYfvhTL7aodTMfKVus4U
	dcDElO7vql22xCzlTWX5AnY1w0fb4SWGTSzi5SGMMUMCjkGmLqninUzqAB6F2W54EsQbQsmGB8R
	Sy+UhK45MV7f9pi7seMhkiCXI2c5hbYV83wn3Ug==
X-Received: by 2002:a5d:8d12:: with SMTP id p18mr1850198ioj.31.1616454400850; 
	Mon, 22 Mar 2021 16:06:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu7k1xWnhYDSm0EFBfQCNAQONDLwY6BNvlGOO7m+zBGxNqAEmd03z0teLmEfmccX4ooPBuGuyReP5ZFn05yrM=
X-Received: by 2002:a5d:8d12:: with SMTP id p18mr1850184ioj.31.1616454400712; 
	Mon, 22 Mar 2021 16:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210310191745.80824-1-aahringo@redhat.com>
	<20210310191745.80824-8-aahringo@redhat.com>
	<67ecd684c22170be49be3ca9b28fdb7db5c61c36.camel@redhat.com>
In-Reply-To: <67ecd684c22170be49be3ca9b28fdb7db5c61c36.camel@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 22 Mar 2021 19:06:30 -0400
Message-ID: <CAK-6q+gTR=3zh1kJLYKs-7_tzntqPNH=Ka5GmXOQ+WwKzQfaDw@mail.gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Guillaume Nault <gnault@redhat.com>
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next 7/8] fs: dlm: add reliable
	connection if reconnect
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Mar 16, 2021 at 1:34 PM Paolo Abeni <pabeni@redhat.com> wrote:
>
> On Wed, 2021-03-10 at 14:17 -0500, Alexander Aring wrote:
> > @@ -116,32 +905,21 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
> >               if (msglen > len)
> >                       break;
> >
> > -             switch (hd->h_cmd) {
> > -             case DLM_MSG:
> > -                     if (msglen < sizeof(struct dlm_message)) {
> > -                             log_print("dlm msg too small: %u, will skip this message",
> > -                                       msglen);
> > -                             goto skip;
> > -                     }
> > -
> > +             idx = srcu_read_lock(&nodes_srcu);
> > +             switch (le32_to_cpu(hd->h_version)) {
> > +             case DLM_VERSION_3_1:
> > +                     dlm_midcomms_receive_buffer_3_1((union dlm_packet *)ptr, nodeid);
> >                       break;
> > -             case DLM_RCOM:
> > -                     if (msglen < sizeof(struct dlm_rcom)) {
> > -                             log_print("dlm rcom msg too small: %u, will skip this message",
> > -                                       msglen);
> > -                             goto skip;
> > -                     }
> > -
> > +             case DLM_VERSION_3_2:
> > +                     dlm_midcomms_receive_buffer_3_2((union dlm_packet *)ptr, nodeid);
> >                       break;
> >               default:
> > -                     log_print("unsupported h_cmd received: %u, will skip this message",
> > -                               hd->h_cmd);
> > -                     goto skip;
> > +                     log_print("received invalid version header: %u from node %d, will skip this message",
> > +                               le32_to_cpu(hd->h_version), nodeid);
> > +                     break;
> >               }
> > +             srcu_read_unlock(&nodes_srcu, idx);
>
> I think the srcu usage will be more clear if the lock/unlock are moved
> inside dlm_midcomms_receive_buffer_3_2() and dlm_midcomms_receive_buffe
> r_3_1(), so that they wrap the node lookup and access.
>

On the other hand, we don't have any drop functionality here and
probably will never add such in this switch-case of the processing
loop. Moving it will add more lock/unlock behaviour in case of errors
for a lock which doesn't benefit from less locktimes.

However I will change it.

- Alex

