Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C0182366E6E
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Apr 2021 16:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619016385;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ROM/rJSG4vX9adrS3dLA78Gxxe1lbmomvwTIm48e8ek=;
	b=fx8Urt98SaeCZzf9Hhl2bNt+Vboshsg/V9N3E7e/dMJet3lRfDdS73FmrMxoTpp7DJSQ/M
	MpWJE8O9fruiYkREXgHfkHttKCUUOTumE/TsDfG/difKXCqcQIRUJE90WPYMcleuGzYdGW
	tWXg9en2e1HMCzp4QTvODHDI8hf3jXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-EPWV12cXMyubFW6nxp5Jxg-1; Wed, 21 Apr 2021 10:46:22 -0400
X-MC-Unique: EPWV12cXMyubFW6nxp5Jxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD0C5343A4;
	Wed, 21 Apr 2021 14:45:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD2A1000358;
	Wed, 21 Apr 2021 14:45:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3F1844A58;
	Wed, 21 Apr 2021 14:45:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13LEjn1k029993 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 21 Apr 2021 10:45:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60157114B9C2; Wed, 21 Apr 2021 14:45:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C0A5114B9C1
	for <cluster-devel@redhat.com>; Wed, 21 Apr 2021 14:45:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD21980066D
	for <cluster-devel@redhat.com>; Wed, 21 Apr 2021 14:45:46 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-10-mdpRAMrVMSCC_fterS4jew-1; Wed, 21 Apr 2021 10:45:44 -0400
X-MC-Unique: mdpRAMrVMSCC_fterS4jew-1
Received: by mail-il1-f199.google.com with SMTP id
	d2-20020a056e020c02b029013731419ee1so16203837ile.17
	for <cluster-devel@redhat.com>; Wed, 21 Apr 2021 07:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ROM/rJSG4vX9adrS3dLA78Gxxe1lbmomvwTIm48e8ek=;
	b=gA1+0Z4wUbPzO4hQHKoUQFqXespzOFPYteb1CmPEftJYsASykkDDqz0U/WrFq3D8Z8
	mYN8N0nDJ2iCYxH1o7SY0SidqGbj7P7eGT1ikXdWC58daZQHZnliXF8vENwrLxUmlfah
	F3Wpx9kTM1xK+Jl6NiCJo73ExT54yHv/cPC0j6RR+yUjtHfrY7WzfJtaTXAF9DxQxk5K
	A9zZbIGddW2tsn146mqieB9a5J12VshjtC0cs2QyEiQTzi4cNUaNnM1Kv0osDGNUdXsf
	590NNciXsKInqRLsweryYqdzmbLG50IBiddXHabw0ppxJMq1PUUP9T5/s30QSqfVXAQO
	KxOw==
X-Gm-Message-State: AOAM532lkk15sU517O1LR0P1s+0lJKr/YMkUWF634bjqkqQSObX0jsyH
	pyXVjEH1ODbeksEx5Mw5j+nubgPbPsignlftHzpLdYLi4h0ciHMMWzizTAw1SMTJMENbT5kRpfh
	KyW7b1k5hWjY61qcDIgXPFGVn6yysqAKO7aeaDg==
X-Received: by 2002:a05:6602:8cf:: with SMTP id
	h15mr3008596ioz.148.1619016343933; 
	Wed, 21 Apr 2021 07:45:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+nOj8ejHHoRDe6ApBnhJiwM04lqfftT9cAOll5cX5huJiFF+Z4eBEWIdoln8TVge2wik3+vXmPiBpJldZnx8=
X-Received: by 2002:a05:6602:8cf:: with SMTP id
	h15mr3008575ioz.148.1619016343732; 
	Wed, 21 Apr 2021 07:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210409144859.48385-1-aahringo@redhat.com>
	<20210409144859.48385-5-aahringo@redhat.com>
In-Reply-To: <20210409144859.48385-5-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Wed, 21 Apr 2021 10:45:32 -0400
Message-ID: <CAK-6q+htp6o-vnukUu7nu9uXF93zA9TZ0EhQwYrsCzV1rrcLqw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Apr 9, 2021 at 10:49 AM Alexander Aring <aahringo@redhat.com> wrote:
...
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

This should be GFP_ATOMIC, because we later call this function while
rcu lock is held.

I am worried about the con lookup here, but I think it's fine so far
we call this function inside some workqueue which should synchronize
the free of "con" here. However I will fix that srcu usage later to be
more correct...

- Alex

