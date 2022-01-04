Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D974845E8
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Jan 2022 17:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641313317;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HunFwN9w+RIUi0jtnER+VcOOodVIjoImOAKbGNQnqBM=;
	b=AKHlbBBmmA/1RX1rS5RfEsuKl3aEbyzjMKFo8qXl9jVX8Plud7dqPCMVeBIhU48e4YdJrR
	h1h+oISlR0b2rHbY0Nqq9nnlbk/rp5nwjZfzqTV9JTmmmwfoW9SLaAtRsKM7IK7fcwBKcY
	247r3NW9FvWQvE78fFtnryJV9QB5OyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-HnCbmNZRPde2Ww7bFGhQuw-1; Tue, 04 Jan 2022 11:21:53 -0500
X-MC-Unique: HnCbmNZRPde2Ww7bFGhQuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FF8F801962;
	Tue,  4 Jan 2022 16:21:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C61E9798A6;
	Tue,  4 Jan 2022 16:21:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E96A018095C9;
	Tue,  4 Jan 2022 16:21:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 204GLiRk002655 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jan 2022 11:21:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 466BD400E11D; Tue,  4 Jan 2022 16:21:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42B11400E117
	for <cluster-devel@redhat.com>; Tue,  4 Jan 2022 16:21:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29881108C0EC
	for <cluster-devel@redhat.com>; Tue,  4 Jan 2022 16:21:44 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
	[209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-91-9eKVCaCwObC6Yo3FPc6Oqw-1; Tue, 04 Jan 2022 11:21:42 -0500
X-MC-Unique: 9eKVCaCwObC6Yo3FPc6Oqw-1
Received: by mail-qv1-f70.google.com with SMTP id
	fq14-20020a056214258e00b004112371dccaso30432374qvb.0
	for <cluster-devel@redhat.com>; Tue, 04 Jan 2022 08:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HunFwN9w+RIUi0jtnER+VcOOodVIjoImOAKbGNQnqBM=;
	b=bif/wmJpRx6B922KUv+V9k4e/iCE7tNvte6BdM9VXpBgwnClTm/DuH2xfCECNnA/vc
	jaaK4w5kxwVDTgp0+34k3Uv6nO/gCgY7AtJjN4AaNBLIgtzt9KHhjtcXs9vJihxYJWYd
	3PH48UHl4uUk0dpqL3BW/HV+NBj3WrWdTFFWRPAVOjYbuVZPB0hCbLV1at+T1JfCdme7
	tXZLpp+raJNefO3gyH2qF/OGz0BInqo4yZ1vff6A1RqIZC+XbzsQg3pUZr9zxDEzlVk2
	X5/Eu5LeIHCUJGv2rz5uhR/jEtPbNEElxOwwRFBjBfMIGurbswG7y0MfHcSD1QTh7cJS
	EUUg==
X-Gm-Message-State: AOAM531nN5nvg1pw0489HvxKZLzu2ZexPpikjsBmLWvg7IGpNL1yzrlz
	6JDpjV2C8PD9J70P4Yf1GV0oyhce2QiCaVmWfEuYo/NCmY5T5G3i2HPLVQQiKl7iFvKlP6rQxK5
	r+l+HOyzmAKkrzPgMcoAMPFPU8DvzF4xLyJy6LA==
X-Received: by 2002:a37:bd86:: with SMTP id
	n128mr35473856qkf.770.1641313302369; 
	Tue, 04 Jan 2022 08:21:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzI+MPM2EChlp2mx8rR71rQUTEOb3LkQH5Hdw2HhJjCJhsbW0Bt4nB/Z2GMtTq3zc+9b1YRzy/wyivXbwvYRxE=
X-Received: by 2002:a37:bd86:: with SMTP id
	n128mr35473837qkf.770.1641313302102; 
	Tue, 04 Jan 2022 08:21:42 -0800 (PST)
MIME-Version: 1.0
References: <e9a2e359-685c-2497-d2bf-e36e2c474c7b@redhat.com>
In-Reply-To: <e9a2e359-685c-2497-d2bf-e36e2c474c7b@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 4 Jan 2022 11:21:31 -0500
Message-ID: <CAK-6q+hU6mev5xO8b2Gz8Y20HAKNW7E2gJQ2Z5h-g0rqh7tTgA@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] Upcoming change to the gfs2-utils.git repository
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

On Tue, Jan 4, 2022 at 10:36 AM Andrew Price <anprice@redhat.com> wrote:
>
> Happy new year, all!
>
> Just a heads-up that the main branch in gfs2-utils.git will be renamed
> from master to main tomorrow (January 5). I will follow the procedure here:
>
>    https://wiki.clusterlabs.org/wiki/How_to_rename_git_default_branch
>
> The wiki page also has a section on how to update your local clone to
> use the new upstream branch name. Thanks to Ken for writing that up!
>
> This change affects https://pagure.io/gfs2-utils.git
>
> I will post a follow-up once the change has been completed.

I think as dlm (userspace) is part of clusterlabs infrastructure the
dlm repository [0] should also be switched?

- Alex

[0] https://pagure.io/dlm

