Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 24DF22077A0
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jun 2020 17:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593013024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zqrvU86wv9Lhr8FTVpWM7m1wNLNApdZuX2i9UY7DluM=;
	b=PvCJgVGWiOjGaLlGtWQjJH0cqaEJ28soABCt7D5qJkv4u1xMwZl3g7lEmaFYnxIpc5niOu
	6LH2fdTIe80AiDdZxLGYOabLyH0wF3aXpo66FyVO7qaMbRcAiQ0J5/01FkQCJ4RV/iE98u
	wfrlqHhKW+R01mk9ve1V1aiP8o9nvCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-4eACHSy-OVKMBJs3fDndpQ-1; Wed, 24 Jun 2020 11:37:02 -0400
X-MC-Unique: 4eACHSy-OVKMBJs3fDndpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDDD11B18BC1;
	Wed, 24 Jun 2020 15:36:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55DA560F8A;
	Wed, 24 Jun 2020 15:36:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F203587585;
	Wed, 24 Jun 2020 15:36:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05OFapPV029978 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 11:36:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E4F610CD66F; Wed, 24 Jun 2020 15:36:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98F8A10CD778
	for <cluster-devel@redhat.com>; Wed, 24 Jun 2020 15:36:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D8A6101A525
	for <cluster-devel@redhat.com>; Wed, 24 Jun 2020 15:36:49 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
	[209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-iaRhRH7vNIeiEv7Jg3oRfw-1; Wed, 24 Jun 2020 11:36:46 -0400
X-MC-Unique: iaRhRH7vNIeiEv7Jg3oRfw-1
Received: by mail-io1-f71.google.com with SMTP id a16so1724650iow.9
	for <cluster-devel@redhat.com>; Wed, 24 Jun 2020 08:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zqrvU86wv9Lhr8FTVpWM7m1wNLNApdZuX2i9UY7DluM=;
	b=VVA00tBBZAiOPokHhCdwPwXKLre/1UVPTB8FbhqnRvQFzc/wHdwS2rl+3WcQvBgfR4
	MaHGBuho6zirI7wtPy7ozmUDeM8Flq8gRjgbnP8A+t9FQyP2JNPi+ghN8FMkDpmq+9ea
	IzeZhOJSADEdr7JDpxY6SppCSwob9u73SEHd/cYdCFHzHvgyeBCaeCcVMBtH4dX+A1fT
	h/s8nOP32JQpDfISL7IXErTjx3Blh0+vYkrrGOsFyft8lhZZ26WIFr25UMiWxXgT9K9A
	Q50OSFcn8wYKDblbZ2nSJgzv9AkZ9RJuQsXeDllnEALHua0EBtQmCvwQMsehQg6KZLHL
	hujA==
X-Gm-Message-State: AOAM530Y+spJ2I7yezlHmvfYz9JIimB8F9dEZRzJFF9816MG7I4CgaCb
	c6lIGicJ+P76bSvDbEkZYYReWtNmgsk6cTkTPNtstgSySy0ZKcoBg92bAm2tTEYEkV4gZ8fvaHz
	HCBe1KFaEVzG3z2Q7yC/pZgumgxGsI1Hx7LS9rA==
X-Received: by 2002:a92:dacf:: with SMTP id o15mr26683389ilq.36.1593013005590; 
	Wed, 24 Jun 2020 08:36:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwval89lbwySrrfJvDjQFuBPHeKdCJGMOmEY3+VWaOTQq5cyLz4/pYEoV6vohCxXwVONB02B6qv2FpdvI7W9R8=
X-Received: by 2002:a92:dacf:: with SMTP id o15mr26683382ilq.36.1593013005401; 
	Wed, 24 Jun 2020 08:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200616170713.32210-1-aahringo@redhat.com>
	<20200616170713.32210-4-aahringo@redhat.com>
In-Reply-To: <20200616170713.32210-4-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Wed, 24 Jun 2020 11:36:34 -0400
Message-ID: <CAK-6q+gF9xfOCXq2GgXmpmCMX98ih+k+XF4SUmSEMpm_0+1nOQ@mail.gmail.com>
To: ccaulfie@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH dlm 3/3] dlm_controld: add support for
 per nodeid configuration
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Jun 16, 2020 at 1:07 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds support to make a configuration per nodeid and key-value
> pairs. As example this patch will introduce the key mark to set via configfs
> comms per nodeid the SO_MARK socket option.
> ---
>  dlm_controld/Makefile      |  3 +-
>  dlm_controld/action.c      | 31 ++++++++++++--
>  dlm_controld/dlm.conf.5    | 19 +++++++++
>  dlm_controld/dlm_daemon.h  |  5 ++-
>  dlm_controld/main.c        |  4 ++
>  dlm_controld/member.c      |  6 ++-
>  dlm_controld/node_config.c | 87 ++++++++++++++++++++++++++++++++++++++
>  dlm_controld/node_config.h | 33 +++++++++++++++
>  8 files changed, 182 insertions(+), 6 deletions(-)
>  create mode 100644 dlm_controld/node_config.c
>  create mode 100644 dlm_controld/node_config.h
>
...
> +
> +int node_config_init(const char *path)
> +{
> +       char line[MAX_LINE], tmp[MAX_LINE];
> +       unsigned long mark;
> +       FILE *file;
> +       int nodeid;
> +       int rv;
> +
> +       /* if no config file is given we assume default node configuration */
> +       file = fopen(path, "r");
> +       if (!file) {
> +               log_debug("No config file %s, we assume default node configuration: mark %" PRIu32,
> +                         path, nc_default.mark);
> +               return 0;
> +       }
> +
> +       while (fgets(line, MAX_LINE, file)) {
> +               if (line[0] == '#')
> +                       continue;
> +               if (line[0] == '\n')
> +                       continue;
> +
> +               if (!strncmp(line, "node", strlen("node"))) {
> +                       rv = sscanf(line, "node id=%d mark=%s" PRIu32, &nodeid, tmp);

I will send a v2 which removes the PRIu32 here, this was a leftover
from previous code. I changed the code to deal with hexadecimal values
from user input as well.

- Alex

