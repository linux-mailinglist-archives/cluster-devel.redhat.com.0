Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 000E9368870
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Apr 2021 23:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619125959;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ZOSYEWvPjb9hgL7Njb+c+zzdIXfHNeYcPMO2SecMgKM=;
	b=CqLRJaiUzVqb/P2xz8rYEQPXSGojCq3sMaXYmwEckEDP2wpUm4JqCJHu55+ETLPfotj+XE
	otcdgI/mF8aiU5KISmoweeYFspM1qio0uu1lDdk1JGyFbyAnLG6zRsnHV+IUialjV/TVeZ
	zlm2L0YTiOnr3RMS01T98w08O4KevvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-YHvDq6syMwaAqyIpzWheRQ-1; Thu, 22 Apr 2021 17:12:36 -0400
X-MC-Unique: YHvDq6syMwaAqyIpzWheRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8179684B9A3;
	Thu, 22 Apr 2021 21:12:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2A560C17;
	Thu, 22 Apr 2021 21:12:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F21B1806D1A;
	Thu, 22 Apr 2021 21:12:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MLCEYj004836 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 17:12:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 85DB91055056; Thu, 22 Apr 2021 21:12:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CFF310A58CB
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 21:12:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A99B7101A52C
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 21:12:11 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
	[209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-44-PUUtsz9zNdKQVNSEtORmYg-1; Thu, 22 Apr 2021 17:12:09 -0400
X-MC-Unique: PUUtsz9zNdKQVNSEtORmYg-1
Received: by mail-io1-f71.google.com with SMTP id
	q11-20020a5d87cb0000b02903ef3c4c5374so10694364ios.20
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 14:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZOSYEWvPjb9hgL7Njb+c+zzdIXfHNeYcPMO2SecMgKM=;
	b=S7HwFPPx+5tm+o+HN9KDD9zavfojUX6bomokRAaUmUzC7nQnJx7r1qEjH8zJpEimin
	mThD3JH9r3anjqP7Jk1ebq+EI+2PdrW0U5+OVlnl3mw+LGlrZjeCvpgGMue+3+6t0iYQ
	xp3ubGZGnp6IwFi20lbIfhk2LpR6dZSjqFOO266ASbTsR/WVxnn8SaHxFlrxFgvlhubB
	M0LxCgiqJ3knDCNYJVq2qwVz8L9uFtGKCnqoPJ/I3ykN/fNSDVDcOOgwLVQGqJrTSuHV
	K2j9FiD9ysUje23eFlKN+AP1/eYGhDEnn01sILYNpeQNafhVtMkK5eKc0kx6Sb+35taE
	5Ftg==
X-Gm-Message-State: AOAM532Pb7bge8vv4xT9k6gYpP1zoVa5IZSM4bvPXi/Htb+Nsf2IhInj
	087EdLxsw4X5R++gGRrgmlB8mMzwQsdFnZ9RFUYDxjtrUmrdA2PVBtTwqiN64VuRkn+RbyYiO41
	PZwLw2HV6wJ5TNQj8c5DdUf1W1AXPL0V9lnzA4g==
X-Received: by 2002:a02:9643:: with SMTP id c61mr796680jai.124.1619125928340; 
	Thu, 22 Apr 2021 14:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymo0CBF9EoUdqj51ihFDSAdws/dCdpE//P5G0XTbwVdOFx51XI2wIdK+t+3NfCChXBMFZghatsKlrD9tWnd24=
X-Received: by 2002:a02:9643:: with SMTP id c61mr796643jai.124.1619125927736; 
	Thu, 22 Apr 2021 14:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210409144859.48385-1-aahringo@redhat.com>
	<20210409144859.48385-5-aahringo@redhat.com>
In-Reply-To: <20210409144859.48385-5-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Thu, 22 Apr 2021 17:11:56 -0400
Message-ID: <CAK-6q+jT3K_qaj6h1=zu4bFN2UDQxHa0mCXMBKgf_9xByPbYpQ@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Guillaume Nault <gnault@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [Cluster-devel] [PATCHv4 dlm/next 4/8] fs: dlm: add
 functionality to re-transmit a message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Apr 9, 2021 at 10:49 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch introduces a retransmit functionality for a lowcomms message
> handle. It's just allocates a new buffer and transmit it again, no
> special handling about prioritize it because keeping bytestream in order.
>
> To avoid another connection look some refactor was done to make a new
> buffer allocation with a preexisting connection pointer.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/lowcomms.c | 55 ++++++++++++++++++++++++++++++++++-------------
>  fs/dlm/lowcomms.h |  1 +
>  2 files changed, 41 insertions(+), 15 deletions(-)
>
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index ade1a5266e4a..fb04448c4e48 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -1447,25 +1447,14 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
>         return e;
>  };
>
> -void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
> -                             void (*cb)(void *buf, void *priv), void *priv)
> +static void *dlm_lowcomms_new_buffer_con(struct connection *con, int len,
> +                                        gfp_t allocation, char **ppc,
> +                                        void (*cb)(void *buf, void *priv),
> +                                        void *priv)
>  {
>         struct writequeue_entry *e;
> -       struct connection *con;
>         struct dlm_msg *msg;
>
> -       if (len > DEFAULT_BUFFER_SIZE ||
> -           len < sizeof(struct dlm_header)) {
> -               BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
> -               log_print("failed to allocate a buffer of size %d", len);
> -               WARN_ON(1);
> -               return NULL;
> -       }
> -
> -       con = nodeid2con(nodeid, allocation);
> -       if (!con)
> -               return NULL;
> -
>         msg = kzalloc(sizeof(*msg), allocation);
>         if (!msg)
>                 return NULL;
> @@ -1485,6 +1474,26 @@ void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
>         return msg;
>  }
>
> +void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
> +                             void (*cb)(void *buf, void *priv), void *priv)
> +{
> +       struct connection *con;
> +
> +       if (len > DEFAULT_BUFFER_SIZE ||
> +           len < sizeof(struct dlm_header)) {
> +               BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
> +               log_print("failed to allocate a buffer of size %d", len);
> +               WARN_ON(1);
> +               return NULL;
> +       }
> +
> +       con = nodeid2con(nodeid, allocation);
> +       if (!con)
> +               return NULL;
> +
> +       return dlm_lowcomms_new_buffer_con(con, len, GFP_ATOMIC, ppc, cb, priv);
> +}
> +
>  void dlm_lowcomms_commit_buffer(void *mh)
>  {
>         struct dlm_msg *msg = mh;
> @@ -1525,6 +1534,22 @@ void dlm_lowcomms_get_buffer(void *mh)
>         kref_get(&msg->ref);
>  }
>
> +void dlm_lowcomms_resend_buffer(void *mh)
> +{
> +       struct dlm_msg *msg = mh;
> +       void *mh_new;
> +       char *ppc;
> +
> +       mh_new = dlm_lowcomms_new_buffer_con(msg->entry->con, msg->len,
> +                                            GFP_NOFS, &ppc, NULL, NULL);
> +       if (!mh_new)
> +               return;
> +
> +       memcpy(ppc, msg->ppc, msg->len);
> +       dlm_lowcomms_commit_buffer(mh_new);
> +       dlm_lowcomms_put_buffer(mh_new);
> +}

I will change this functionality so that it checks if the actual
message is already in "retransmit" state. If yes it will not queue a
message again which sits somewhere inside the "dlm lowcomms send
queue", the retransmit state will be dropped when the dlm message was
sent out. It might be triggered again for retransmission then.

I had some terrible experience with a lot of reconnects due tcpkill
test and the "lowcomms queue send" was getting bigger and bigger with
a bunch of retransmits and the other peer was doing "a lot" of work to
filter these messages out because already received.

- Alex

