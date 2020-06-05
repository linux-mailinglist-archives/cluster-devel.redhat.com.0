Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 959991F03DC
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403026;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=wpHJAx9fjx2aK4IAmIoAMtpDZCQh6o8wk10PqzFvekw=;
	b=GoyfdCkXDQ6rhkS0BEXNRGAnjb9QScqG6WfKEwVPgI9jeWVr8U1KKBSQHfkBAzYxMJcTPE
	JlP3PgUwqCg/nq7RzLHbtQOjKe0Pn057JyySaz/3mylbP45FKFAl4fa1LSBWAsBKwpdgbR
	tJINx3QQv6oHgaLEWuzY0gq0AESwBKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-UqQ-w9hsOKGFitGLYmv2zg-1; Fri, 05 Jun 2020 20:23:44 -0400
X-MC-Unique: UqQ-w9hsOKGFitGLYmv2zg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A53A31883600;
	Sat,  6 Jun 2020 00:23:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9317D19D71;
	Sat,  6 Jun 2020 00:23:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 812FF10480E;
	Sat,  6 Jun 2020 00:23:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055EhaDh008575 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 10:43:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CC7120234BD; Fri,  5 Jun 2020 14:43:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F06FD2029F80
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 14:43:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E5BD833B4C
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 14:43:31 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-I0hmBPmpNH6vqRbhh94_Mg-1; Fri, 05 Jun 2020 10:43:29 -0400
X-MC-Unique: I0hmBPmpNH6vqRbhh94_Mg-1
Received: by mail-ot1-f70.google.com with SMTP id w21so4094817oti.16
	for <cluster-devel@redhat.com>; Fri, 05 Jun 2020 07:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wpHJAx9fjx2aK4IAmIoAMtpDZCQh6o8wk10PqzFvekw=;
	b=If4/dBbsIuYMZxjfghwa7t+QoqVj4Aic3lqDHcs4np3WQST1w3mllgkPunPuBxS33a
	DCOpWGuGeUJgMkUkUiY1l/XF3ZVlmnN49pRkgHY2oE+OBizRlYpi6uTUCML+tbDLI/Hw
	7dF4THEDyaCtPwUx/yqIOGpsAX9l8ERzS5hTUkCNfFhAU8tZ5AiipydUHS8SMsgLNkF4
	18waSLFnA9WwrOSr1Crord0Vnu/1zFx39FC+aD3xaMEGh8qAIIzRqvAUMZvRAHQUJY4+
	T05wZKDToxjdhBVKRMeE3NvKDyhGiciqU/ZM6K+2ftxCT4Y+HAPfKXv56iNEg9OHZWsg
	lsLA==
X-Gm-Message-State: AOAM530c5Sp9VC7Dr624mEt8oO1k0se10BY/2faSX+UOITnGG/o17ZRu
	yHIIUiHsa1mdrIfS2dvtMDUJGVUb0dOkFtj/gnsmZK4Y4crkb8ZIiVCOztXq+Mzf5DycbpNYpTj
	LsP3220/PdPb7SxvN/mYutK2eY/0leJ82cK/Ljw==
X-Received: by 2002:aca:f5d0:: with SMTP id t199mr2079996oih.178.1591368208604;
	Fri, 05 Jun 2020 07:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHgBYgONzCIf0vVndtuT3Vr2UXUv4uXy93sYUOZoNIq0H2sVIJucSy2An1GEovkgrl7uttZLpVLSX3XlbqgkE=
X-Received: by 2002:aca:f5d0:: with SMTP id t199mr2079987oih.178.1591368208463;
	Fri, 05 Jun 2020 07:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200526130536.295081-1-rpeterso@redhat.com>
	<20200526130536.295081-8-rpeterso@redhat.com>
In-Reply-To: <20200526130536.295081-8-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 5 Jun 2020 16:43:17 +0200
Message-ID: <CAHc6FU6bwAae-Th4F7sGeSRB2nqLXzOK43+z2y_gkmG9yOfOCQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 7/8] gfs2: Add new trace point for glock
 ail management
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Bob,

this very much looks like a debugging trace point that has no business
in production code.

Thanks,
Andreas

